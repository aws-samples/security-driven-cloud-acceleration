# Security-Driven Cloud Acceleration (SDCA) Sample Code

What Is It? 
Security-Driven Cloud Acceleration (SDCA) is a set of infrastructure-as-code templates that embeds core AWS security best practices earlier in the customer journey into any workload, program, and industry solution. 

What Are We Doing?
The goal of SDCA is to help reduce friction for customers to “shift-left and automate” with security earlier in their journey. SDCA simplifies increasing security posture by applying the minimum AWS security recommendations to achieve a defense-in-depth strategy across any workload, program or industry solution. SDCA can be used by customers and partners to create a secure landing zone during migrations or be secure foundation for cloud native development. By making it easier, faster, and less expensive to increase security posture while embedding this with core workload services, SDCA will further increase customer confidence that AWS is the most secure cloud for innovation. 

Who Benefits From This?
SDCA is an embeddable set of free IaC templates to be used by builders, infrastructure teams, security teams, CISOs and partners to increase security posture, simplify and accelerate the implementation of core AWS security services and automate their best practices, helping customers save time, money, and frustration. They are built upon the AWS Security Reference Architecture (SRA), a stable, proven and comprehensive library of AWS security best practices, but simplify the usage to just the minimum recommended security services for any workload, any account, and any customer. By leveraging infrastructure as code, customers benefit from increased observability into their security posture and policies, simplifying audits and compliance.

How It Works
The primary deliverable of SDCA is a set of infrastructure-as-code (IaC) templates available in both AWS CloudFormations format and HashiCorp Terraform format, the two most popular IaC formats for automating security policy as code. These templates will be available for free on the AWS Samples GitHub account. These templates can be embedded into any other CloudFormations or Terraform offerings to allow customers to enable security best practices with workloads. Estimated time to complete ranges from 15-45 minutes depending on workload and configuration complexity. Once implemented, customers can automate Git pulls of the latest code updates and security best practices. 

The following AWS services and best practices are the primary focus of the SDCA program:
•	AWS Security Hub
•	Amazon GuardDuty
•	Amazon Key Management Service (KMS)
•	AWS Shield Advanced.

The following services may used in the provisioning and usage of SDCA, but are not primary focus of the program. 
•	AWS Config (for Conformance Packages)
•	AWS Control Tower (optional)
•	AWS Security Reference Architecture (SRA)
•	AWS CloudFormations and/or HashiCorp Terraform IaC formats

Measuring Results
•	Increased customer security posture through AWS Trusted Advisor scores. 
•	Compression of migration timelines, account creation, service activation, and security best practices enablement. 
•	Reduction in time and costs associated to account and service provisioning, data and infrastructure protection, Mean Time To Detection (MTTD) and Mean Time To Remediation (MTTR) through security automation.

Summary Of Design
The IaC template is built upon the Security Reference Architecture (SRA), and consists of a modular bundle of five configuration files, one for each of the four core security services, plus one main file. In the main file, customers can configure high-level setting such as whether they want this to run on a single workload, account, or entire organization, what AWS region(s) they would like this to run in, and which AWS Config Conformance Packs they would like to apply (such as CIS AWS Foundations, NIST 800-53 rev 5, HIPAA, FedRamp Moderate, and many more). 
   
Availability & Further Information
This is scheduled for release as a POC in Q3 2023 as a combination of the IaC templates, a customer-facing first call deck (FCD), and blogs in the AWS Security Blog channel and co-promotion in the AWS blog channels for workloads such as Containers, AI/ML, Storage, and more. AWS Partners will get a preview to assist with early joint adoption and feedback. 

For further information and to stay informed of release, contact Christopher Rae (xrae@amazon.com), Principal Worldwide Security GTM Specialist at Amazon Web Services. 




