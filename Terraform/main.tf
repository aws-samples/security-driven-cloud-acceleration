provider "aws" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

module "guardduty" {
  source  = "aws-ia/guardduty/aws"
  version = "0.0.2"

  replica_region               = "us-east-1"
  enable_guardduty             = true
  enable_s3_protection         = true
  enable_kubernetes_protection = true
  enable_malware_protection    = true
  enable_snapshot_retention    = true
  finding_publishing_frequency = "FIFTEEN_MINUTES"
  filter_config = [{
    name        = "guardduty_filter"
    description = "AWS GuardDuty example filter."
    rank        = 1
    action      = "ARCHIVE"
    criterion = [

      {
        field  = "region"
        equals = ["us-west-2"]
      },
      {
        field      = "service.additionalInfo.threatListName"
        not_equals = ["some-threat", "another-threat"]
      },
      {
        field        = "updatedAt"
        greater_than = "2023-01-01T00:00:00Z"
        less_than    = "2023-12-31T23:59:59Z"
      },
      {
        field                 = "severity"
        greater_than_or_equal = "4"
      }
  ] }]

  ipset_config = [{
    activate = false
    name     = "DefaultGuardDutyIPSet"
    format   = "TXT"
    content  = "10.0.0.0/8\n"
    key      = "DefaultGuardDutyIPSet"
  }]

  threatintelset_config = [{
    activate   = false
    name       = "DefaultGuardThreatIntelSet"
    format     = "TXT"
    content    = "1.10.16.0/20\n1.19.0.0/16\n"
    key        = "DefaultGuardThreatIntelSet"
    object_acl = "public-read"

  }]
  publish_to_s3        = true
  guardduty_bucket_acl = "private"
  tags                 = {}
}

module "security_hub" {
  source  = "aws-ia/security-hub/aws"
  version = "0.0.1"

  enable_default_standards  = false
  control_finding_generator = "STANDARD_CONTROL"
  auto_enable_controls      = true

  product_config = [{
    enable = true
    arn    = "arn:aws:securityhub:${data.aws_region.current.name}::product/aws/guardduty"
  }]

  standards_config = {
    aws_foundational_security_best_practices = {
      enable = true
      status = "ENABLED"
    }
    cis_aws_foundations_benchmark_v120 = {
      enable = false
    }
    cis_aws_foundations_benchmark_v140 = {
      enable = true
      status = "ENABLED"
    }
    nist_sp_800_53_rev5 = {
      enable = false
    }
    pci_dss = {
      enable = false
    }
  }

  action_target = [{
    name        = "Send to Amazon SNS"
    identifier  = "SendToSNS"
    description = "This is a custom action to send findings to SNS Topic"
  }]

}

# Security Hub Standards Control Example
# Sample control findings https://docs.aws.amazon.com/securityhub/latest/userguide/sample-control-findings.html

resource "aws_securityhub_standards_control" "ensure_iam_password_policy_prevents_password_reuse" {
  standards_control_arn = "arn:aws:securityhub:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:control/cis-aws-foundations-benchmark/v/1.4.0/1.10"
  control_status        = "DISABLED"
  disabled_reason       = "Password policies are managed by external resource"

  depends_on = [module.security_hub]
}

# Security Hub Insights Examples
# Full list of filters https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_insight#filters

resource "aws_securityhub_insight" "this" {
  filters {
    created_at {
      date_range {
        unit  = "DAYS"
        value = 7
      }
    }
    network_source_ipv4 {
      cidr = "10.0.0.0/16"
    }
    criticality {
      gte = "80"
    }
    resource_tags {
      comparison = "EQUALS"
      key        = "Environment"
      value      = "Development"
    }
  }

  group_by_attribute = "AwsAccountId"

  name = "insight"

  depends_on = [module.security_hub]
}
