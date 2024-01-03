# AWS Security-Driven Cloud Acceleration (SDCA) CloudFormation Templates <!-- omit in toc -->

Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved. SPDX-License-Identifier: CC-BY-SA-4.0

- [Overview of the SDCA Deployment Process](#overview-of-the-sdca-deployment-process)
  - [IMPORTANT: Enable Trusted Access with AWS Organizations for StackSets](#important-enable-trusted-access-with-aws-organizations-for-stacksets)
- [CloudFormation Implementation Instructions](#cloudformation-implementation-instructions)
  - [I. Download the SDCA CloudFormation Template](#i-download-the-sdca-cloudformation-template)
  - [II. (Option A) Deployment using the AWS Console](#ii-option-a-deployment-using-the-aws-console)
  - [II. (Option B) Deployment using the AWS CLI](#ii-option-b-deployment-using-the-aws-cli)
  - [CloudFormation AWS SDCA Removal Instructions](#cloudformation-aws-sdca-removal-instructions)
- [Easy Setup Architecture Details](#easy-setup-architecture-details)
- [Common Prerequisites Architecture Details](#common-prerequisites-architecture-details)
- [Config in Management Account Architecture Details](#config-in-management-account-architecture-details)
- [Security Hub Architecture Details](#security-hub-architecture-details)
- [GuardDuty Architecture Details](#guardduty-architecture-details)

## Introduction<!-- omit in toc -->

The SDCA provides a consolidated method to install key security services in your environment with a single CloudFormation template.  The SDCA leverages the solutions developed as a part of the AWS SRA code library to deliver this in alignment with the AWS Cloud Adoption Framework, Well-Architected Framework, and Security Best Practices.

### Overview of the SDCA Deployment Process

The SDCA CloudFormation template performs all of the steps in this section automatically so that you do not have to perform them on your own.  The initial preparatory steps include creating an SDCA staging bucket to then download and store the AWS SRA Easy Setup in.  At this point, the SDCA CloudFormation template will setup AWS Config in the management account, AWS Security Hub into the AWS Organization, and also Amazon GuardDuty into the AWS Organization.  Please refer to the AWS SRA Easy setup for more details at [AWS SRA Easy Setup](https://github.com/aws-samples/aws-security-reference-architecture-examples/tree/main/aws_sra_examples/easy_setup)

#### IMPORTANT: Enable Trusted Access with AWS Organizations for StackSets

For the this deployment to work, you must enabled trusted access with AWS Organizations.

- Please follow the [AWS CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-enable-trusted-access.html) instruction documentation to learn how to do this.

### CloudFormation Implementation Instructions

- The process to implement security services as a part of the SDCA begins with downloading the `sdca-setup.yaml` cloudformation template from the SDCA code repository.  Then, follow the instructions for deployment via the AWS console.
- IMPORTANT: [Trusted Access with AWS Organizations for StackSets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-enable-trusted-access.html) must be manually enabled first.

#### I. Download the SDCA CloudFormation Template

Download the `sdca-setup.yaml` template by either navigating to it in the AWS SDCA code repository, or by using the example download commands in this section.

##### Example Download Command<!-- omit in toc -->

```bash
curl -LJO https://raw.githubusercontent.com/aws-samples/security-driven-cloud-acceleration/main/CloudFormation/templates/sdca-setup.yaml
```

#### II. (Option A) Deployment using the AWS Console

Deployment using the AWS console requires the template to be downloaded first (see above).

##### Step 1 - Navigate to the CloudFormation Service Console<!-- omit in toc -->

In your AWS management account, navigate to the CloudFormation service console.

##### Step 2 - Navigate to the Stacks area<!-- omit in toc -->

In the CloudFormation service console, navigate to the stacks area.

##### Step 3 - Create a stack<!-- omit in toc -->

In the stacks area, create a stack, and then select the "Upload a template file" option.  Click on "Next", then follow the process to deploy the stack.
Be sure to specify the appropriate parameters for the template as needed.

<!-- - IMPORTANT: If `AWS Organizations` is being used without AWS Control Tower, you must also specify the following parameter values as you create the stack:
  - `pControlTower` as `false`
  - `pLogArchiveAccountId` as the AWS Account Id of the account designated to be the `Log Archive` account.
  - `pSecurityAccountId` as the AWS Account Id of the account designated to be the `Security Tooling` account.
  - `pGovernedRegions` as a list of AWS regions separated by commas -->

#### II. (Option B) Deployment using the AWS CLI

Deployment using the AWS CLI requires the template to be downloaded first.

##### Step 1 - Run the AWS CloudFormation Deploy command<!-- omit in toc -->

Prepare and run the `aws cloudformation deploy` command to launch the template.  Use the example command below to do this.

###### IMPORTANT<!-- omit in toc -->

- Be sure to alter the folder/path for the `sdca-setup.yaml` template-file appropriately (replace `<path to template file>`)
- Be sure to specify the proper parameter overrides and specify the alarm email address (`<email address>`)
<!-- - If `AWS Organizations` is being used without AWS Control Tower, you must also specify the following parameter values as you create the stack:
  - `pControlTower` as `false`
  - `pLogArchiveAccountId` as the AWS Account Id of the account designated to be the `Log Archive` account.
  - `pSecurityAccountId` as the AWS Account Id of the account designated to be the `Security Tooling` account.
  - `pGovernedRegions` as a list of AWS regions separated by commas -->

###### Example Command To Launch The Template in AWS Control Tower landing zone<!-- omit in toc -->

```bash
aws cloudformation deploy --template-file <path to template file>/sdca-setup.yaml --stack-name sdca-setup --capabilities CAPABILITY_NAMED_IAM --parameter-overrides pSRAAlarmEmail=<email address>
```

#### CloudFormation AWS SDCA Removal Instructions

From within the management account:

- Delete the `sdca-setup` CloudFormation stack
- Delete any remaining `sdca-*` and `sra-*` CloudWatch log groups
- Delete any remaining `/sra/*` SSM Parameters
- Delete any remaining `sra-*` IAM roles (be sure to check all other accounts for these as well)
- Delete any remaining `sra-*` Lambda functions
- Delete any remaining `sdca-*` and `sra-*` S3 buckets

### Easy Setup Architecture Details

See [AWS SRA Easy Setup Architecture Details](https://github.com/aws-samples/aws-security-reference-architecture-examples/tree/main/aws_sra_examples/easy_setup#easy-setup-architecture-details) for more information.

![Easy Setup](https://raw.githubusercontent.com/aws-samples/aws-security-reference-architecture-examples/main/aws_sra_examples/easy_setup/assets/SRA-Easy-Setup.png)

### Common Prerequisites Architecture Details

See [AWS SRA Common Prerequisites Deployed Resource Details](https://github.com/aws-samples/aws-security-reference-architecture-examples/tree/main/aws_sra_examples/solutions/common/common_prerequisites#deployed-resource-details) for more information.

![Common Prerequisites](https://raw.githubusercontent.com/aws-samples/aws-security-reference-architecture-examples/main/aws_sra_examples/solutions/common/common_prerequisites/documentation/common-prerequisites.png)

### Config in Management Account Architecture Details

See [AWS SRA Config Management Deployed Resource Details](https://github.com/aws-samples/aws-security-reference-architecture-examples/tree/main/aws_sra_examples/solutions/config/config_management_account#deployed-resource-details) for more information.

![Config Management](https://raw.githubusercontent.com/aws-samples/aws-security-reference-architecture-examples/main/aws_sra_examples/solutions/config/config_management_account/documentation/config-management-account.png)

### Security Hub Architecture Details

See [AWS SRA Security Hub Deployed Resource Details](https://github.com/aws-samples/aws-security-reference-architecture-examples/tree/main/aws_sra_examples/solutions/securityhub/securityhub_org#deployed-resource-details) for more information.

![Security Hub](https://raw.githubusercontent.com/aws-samples/aws-security-reference-architecture-examples/main/aws_sra_examples/solutions/securityhub/securityhub_org/documentation/securityhub-org.png)

### GuardDuty Architecture Details

See [AWS SRA GuardDuty Deployed Resource Details](https://github.com/aws-samples/aws-security-reference-architecture-examples/tree/main/aws_sra_examples/solutions/guardduty/guardduty_org#deployed-resource-details) for more information.

![GuardDuty](https://raw.githubusercontent.com/aws-samples/aws-security-reference-architecture-examples/main/aws_sra_examples/solutions/guardduty/guardduty_org/documentation/guardduty-org.png)
