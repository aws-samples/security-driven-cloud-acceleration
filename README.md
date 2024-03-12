# Security-Driven Cloud Acceleration (SDCA) 

## What is Security-Driven Cloud Acceleration (SDCA)?
Security-Driven Cloud Acceleration (SDCA) is a security solution built on [infrastructure-as-code (IaC)](https://aws.amazon.com/what-is/iac/) templates that embeds core [Amazon Web Services (AWS) security](https://aws.amazon.com/architecture/security-identity-compliance/?cards-all.sort-by=item.additionalFields.sortDate&cards-all.sort-order=desc&awsf.content-type=*all&awsf.methodology=*all) earlier in the customer journey into any workload, program, and industry solution in alignment with the AWS Cloud Adoption Framework, AWS Well-Architected Framework, and AWS Security Best Practices.

![SDCA Reference Diagram](https://github.com/aws-samples/security-driven-cloud-acceleration/blob/main/SDCA%20Reference%20Diagram.png?raw=true)

## Benefits
The goal of SDCA is to help reduce friction for customers to “shift-left and automate” with strong security earlier in their journey. SDCA simplifies improving security posture by applying the minimum AWS security to accelerate a [secure-by-design](https://www.cisa.gov/securebydesign), [defense-in-depth strategy](https://www.csoonline.com/article/573221/defense-in-depth-explained-layering-tools-and-processes-for-better-security.html) across any workload, program or industry solution. SDCA can be used by customers and partners to create a secure landing zone during migrations and/or be secure foundation for cloud native development. By making it easier, faster, and less expensive to automate security posture improvements while embedding this with core workload services, SDCA will further increase customer confidence that AWS is the most secure cloud for innovation. 

## Audience 
SDCA is an embeddable set of free-to-use IaC templates for CISOs, security teams, software developers, solutions architects, infrastructure teams, and partners to increase security posture, simplify and accelerate the implementation of core AWS security services and automate their best practices, helping customers save time, money, and frustration. The templates are built upon the continuously improving [AWS Security Reference Architecture (SRA)](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/welcome.html), a stable, proven and comprehensive library of AWS security best practices. They simplify the usage to just the minimum recommended security services for any workload, any account, and any customer. By leveraging infrastructure as code, customers benefit from faster time-to-market, time-to-value, automating security policy-as-code into their devops lifecycles, increasing governance and observability into their security posture and policies, simplifying audits and compliance, and reducing costs, time, and risk associated to security events. 

## How it works
The primary deliverable of SDCA is a set of infrastructure-as-code (IaC) templates available in both [AWS CloudFormation](https://aws.amazon.com/cloudformation/) and [HashiCorp Terraform](https://www.hashicorp.com/products/terraform) formats, the two most popular formats for automating security policy as code. These templates are available for free on the AWS Samples GitHub account. These templates can be embedded into any other CloudFormations or Terraform offerings to allow customers to consistently automate security best practices in workloads and DevOps pipeline. Estimated time to complete ranges from 15-45 minutes depending on workload and configuration complexity. Once implemented, customers can automate Git pulls of the latest code updates and security best practices of the AWS SRA. 

The following AWS services and best practices are the primary focus of the SDCA program:
* [AWS Security Hub](https://aws.amazon.com/security-hub/) for cloud security posture management (CSPM) to perform security best practice checks, aggregate alerts, and enable automated remediation.
* [Amazon GuardDuty](https://aws.amazon.com/guardduty/) (including optional protections for S3, EC2, EKS, EC2, RDS, Malware, and Lambda) for intelligent threat detection that continuously monitors your AWS accounts and workloads for malicious activity and delivers detailed security findings for visibility and remediation.
* [Amazon Key Management Service (KMS)](https://aws.amazon.com/kms/) for creating, managing, and controling cryptographic keys across your applications and AWS services.
* [AWS Shield Advanced](https://aws.amazon.com/shield/) for managed DDoS protection that safeguards applications running on AWS.

The following services and solutions may used in the provisioning and usage of SDCA, but are not primary focus of the program. 
* [AWS Security Reference Architecture (SRA)](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/welcome.html) (as the engine of security best practices recommendations and configurations)
* [AWS CloudFormation](https://aws.amazon.com/cloudformation/) and/or [HashiCorp Terraform](https://www.hashicorp.com/products/terraform) IaC formats (the two most popular IaC formats)
* [AWS Config](https://aws.amazon.com/config/) (for [Conformance Packages](https://docs.aws.amazon.com/config/latest/developerguide/conformance-packs.html))
* [AWS CloudTrail](https://aws.amazon.com/cloudtrail/)  (for logging and GuardDuty threat detection analysis)
* [AWS CodeBuild](https://aws.amazon.com/codebuild/) (for automated building of the SDCA stack and Security Reference Architecture code) 
* [AWS Control Tower](https://aws.amazon.com/controltower/) (optional for customers who want to consistently apply SDCA to all or mutliple accounts in their organization)
* [AWS Lambda](https://aws.amazon.com/lambda/)  (for automated building of the SDCA stack and Security Reference Architecture code)
* [Amazon S3](https://aws.amazon.com/s3/)  (used to create a staging bucket and for configuring logs)

The following AWS services are NOT enabled by the SDCA sample code, but are included in the price of AWS Shield Advanced. These may be enabled in the future by the SDCA templates, but for now must be done manually in [AWS Console](https://aws.amazon.com/console/) or [AWS CLI](https://aws.amazon.com/cli/). 
* [AWS Firewall Manager](https://aws.amazon.com/firewall-manager/)
* [AWS Web Application Firewall (WAF)](https://aws.amazon.com/waf/)

The following AWS services are strongly encouraged for use in parallel:
* [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/)
* [AWS Well-Architected Tool](https://aws.amazon.com/well-architected-tool/) with AWS Trusted Advisor integration

## Design
The IaC template is built upon the [AWS Security Reference Architecture (SRA)](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/welcome.html), and consists of a modular bundle of five configuration files, one for each of the four core security domain services, plus one main configuration file. In the main file, customers can configure high-level setting such as whether they want this to run on a single workload, account, or entire organization (optionally, [AWS Control Tower](https://aws.amazon.com/controltower/) can be used), what AWS region(s) they would like this to run in, and which [AWS Config Conformance Packs](https://docs.aws.amazon.com/config/latest/developerguide/conformance-packs.html) they would like to apply (such as CIS AWS Foundations, NIST 800-53 rev 5, HIPAA, FedRamp Moderate, NIST Privacy Framework v1.0, European Union Agency for Cybersecurity (ENISA) Cybersecurity Guide for SMEs, and many more) together. Any additional configuration parameter entered in the Cloudformation or Terraform templates will override the default settings, which makes these templates an platform for customers to start to adopt and adapt security policy-as-code throughout their organization.

## How to use SDCA templates
### CloudFormation version
* [How to configure and use the SDCA AWS CloudFormation templates in AWS Console and AWS CLI](/CloudFormation/README.md)

### Terraform version
Detailed instructions coming soon!

## Costs
As with most other AWS solutions, customers only pay for what they use. To further make it easier for customers to adopt SDCA as a starting point for their security journey, there is no cost to use the CloudFormation or Terraform scripts. The AWS services enabled by default in the scripts offer free tiers and trials for 30 days, with the exception of [AWS Shield Advanced](https://aws.amazon.com/shield/)  has a different pricing model, and is therefore disabled by default until customers are ready to try it or commit. Additionally, ask your Account Manager about the "AWS Shields Up!" promotion which can help offset the cost and commitment of AWS Shield Advanced for up to 60 days. If Shield Advanced is still outside of your budget today, start with [AWS Web Application Firewall (WAF)](https://aws.amazon.com/waf/) for the base level of web application protection from OWASP Top 10 vulnerabilities, bots an account takeovers. As usage of AWS WAF grows closer to $3,000/month, the price of AWS WAF and AWS Netowrk Firewall will be included in AWS Shield Advanced subscription. Customers should use the [AWS Pricing Calculator](https://calculator.aws/#/) to estimate the costs for their individual workloads prior to enablement. NOTE: AWS Shield Advanced comes with DDoS cost protection to safeguard against scaling charges resulting from DDoS-related usage spikes on protected [Amazon EC2](https://aws.amazon.com/ec2/), [AWS Elastic Load Balancer (ELB)](https://aws.amazon.com/elasticloadbalancing/), [Amazon CloudFront](https://aws.amazon.com/cloudfront/), [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/), and [Amazon Route 53](https://aws.amazon.com/route53/) resources, which may offset other costs. If any of these protected resources scale up in response to a DDoS attack, you can request Shield Advanced service credits through your regular AWS Support channel.

## Frequently Asked Questions
### Q: When should SDCA be applied?
A: To get the maximium benefits for SDCA, it should be applied as early as possible in the design, architecture for any "shift-left" and secure-by-design initiative. It can, however, be added to existing workloads without impacting functionality or performance. 
1. Customers should strongly consider first performing a [threat modeling](https://aws.amazon.com/blogs/security/how-to-approach-threat-modeling/) exercise to identify and evaluate vulnerabilities, threats, and risks, identify the likelihood that each threat will succeed, and assesses the organization’s ability to respond to each identified threat. Consider enrolling your team in AWS's ["Threat Modeling The Right Way For Builders"](https://explore.skillbuilder.aws/learn/course/external/view/elearning/13274/threat-modeling-the-right-way-for-builders-workshop) course for free on SkillBuilder.
2. Customers should then baseline their current security posture with tools such as [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/) and [AWS Well-Architected Tool](https://aws.amazon.com/well-architected-tool/) (with AWS Trusted Advisor integration).
3. Then use SDCA templates as part of the design, architecture, provisioning, and any corrective actions phases to provide the minimum security coverage across the core AWS Security domains of data protection, network and application protection, threat detection and incident response, and privacy and governance. 
4. Reassess the security baseline for security posture score improvements and further security findings. 
5. Continue to increase the security posture through incremental iterative improvements based on security findings in AWS Security Hub, AWS Trusted Advisor, and AWS Well-Architected Tool. 
6. Repeat regularly.

### Q: Why focus on these four foundational AWS Security services?
A: Using these four core AWS Security services together helps customers establish fundamental security controls in each of the core AWS Security, Identity, and Compliance domains of data protection, threat detection and incident response, network and application protection, and privacy and governance. SDCA simplifies improving security posture by applying the minimum AWS security to accelerate a secure-by-design, defense-in-depth strategy across any workload, program or industry solution. When used in conjunction with fine-grained least-privledge access policies with AWS Identity and Access Management (IAM), each of these core security services represent the minimum security recommendations from AWS Security across the [core security domains](https://aws.amazon.com/products/security/?nc=sn&loc=2) of Data Protection ([Amazon Key Management Service (KMS)](https://aws.amazon.com/kms/)), Network & Application Protection ([AWS Shield Advanced](https://aws.amazon.com/shield/)), Threat Detection & Incident Response ([Amazon GuardDuty](https://aws.amazon.com/guardduty/)), and Privacy & Governance ([AWS Security Hub](https://aws.amazon.com/security-hub/)). Additionally, when customers opt-in to enable AWS Shield Advanced, they get AWS WAF and AWS Firewall Manager included in the price, which provides additional defense-in-depth functionality, cost protections, and cost savings for the Network & Application Protection domain.

### Q: How should I measure impact and results? 
A: Customers can measure the impact of using Security-Driven Cloud Acceleration through a variety of metrics such as:
* Increased customer security posture through measuring [AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/) scores and reduced [AWS Security Hub](https://aws.amazon.com/security-hub/) alert severity and volumes.
* Reduction in time and costs associated to account and service provisioning, data and infrastructure protection, [Mean Time To Detection (MTTD)](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/mean-time-to-detect.html) and [Mean Time To Respond (MTTR)](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/mean-time-to-respond.html), [Mean Time To Contain (MTTC)](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/mean-time-to-contain.html), and [Mean Time To Recover (MTTR)](https://docs.aws.amazon.com/whitepapers/latest/aws-security-incident-response-guide/mean-time-to-recover.html) through cloud security automation.
* AWS Shield Advanced comes with DDoS cost protection to safeguard against scaling charges resulting from DDoS-related usage spikes on protected [Amazon EC2](https://aws.amazon.com/ec2/), [AWS Elastic Load Balancer (ELB)](https://aws.amazon.com/elasticloadbalancing/), [Amazon CloudFront](https://aws.amazon.com/cloudfront/), [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/), and [Amazon Route 53](https://aws.amazon.com/route53/) resources. 
* Compression of migration timelines, account creation, service activation, development and testing cycles, and security best practices enablement through cloud security automation.
   
### Q: Is this generally available today?
A: This proof-of-concept was released on February 23rd, 2024. Customers can begin testing with the current version today to get familiar with the process and to adapt the templates to their workloads and organizational needs. It now also includes option to use AWS Control Tower or not, providing maximum flexibility on deploying to a single workload, account, or across an entire organization. 

### Q: What are known issues with SDCA today?
2. The AWS Config module for SRA only supports a single conformance package via CloudFormation at this time. A feature request has been submitted to supporrt multiple conformance packages. In the meantime as a workaround, if customers need to use more than one conformance package at the same time, customers can manually configure multiple conformance packages in AWS Config in the AWS Console, and Security Hub will automatically begin to enforce it. 

### Q: Can I contribute to the Security-Driven Cloud Acceleration project?
A: Yes! If you have feedback and suggestions for how to further improve these templates, fork the repo and submit a pull request. All submissions will be reviewed and evaluated by the AWS Security Reference Architecture team. Read the [AWS contribution guidelines for this project](CONTRIBUTING.md).

## Further information
For further information and to stay informed of general availability releases, contact Christopher Rae (xrae@amazon.com), Principal Worldwide Security GTM Specialist at Amazon Web Services. 
