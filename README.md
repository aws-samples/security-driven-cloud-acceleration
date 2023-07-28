# Security-Driven Cloud Acceleration (SDCA) Sample Code

This project shows CloudFormations and Terraform templates for how to embed and automate core security services into any workload, program, accelerator or industry-specific solution. It contains modular source code for CloudFormations and Terraform and may later include other formats as well, such as CodeCatalyst. By embedding this code into your offering, you can automatically lead with security for your workloads for new customer migrations or cloud native development. This code can also be run for existing customers as standalone module to apply the core security services and best practices to production workloads, and it will notify if there are any conflicts. 

For workloads, programs, and accelerator teams: Simply initiate a Git pull of this software to be part of your infrastructure-as-code resources to ensure that the latest updates to SDCA modules are included in your offerings.

For developers, if you have ideas how to further improve this module, please fork this repo and commit your recommendations! 

NOTE TO CUSTOMERS: Shield Advanced provides advanced DDoS protection. Enabling it gives you more protections and control beyond what AWS Shield Standard provides, including giving you access to use AWS WAF and Firewall Manager. Unlike other AWS services, it has a fixed monthly cost minimum of $3,000 USD. AWS strongly recommends implementing this for the protection of your workloads and accounts, however, by default it will be commented out in this CloudFormation template which requires you to manually opt-in on the service and the additional monthly costs. For more information about Shield Advanced visit https://aws.amazon.com/shield/features/. If you choose to not use AWS Shield Advanced as part of this stack, the remaining services of Security Hub, GuardDuty, and KMS will still be enabled and configured, and you will only be charged for the resources you consume.  

For more information about Security-Driven Cloud Acceleration:

* Watch the SDCA Sneak Preview of the Infrastructure As Code Demo on Broadcast: https://broadcast.amazon.com/videos/744985/
* Read SDCA FCD: https://aws.highspot.com/items/640a3e0727d8c46afb6dd2e0?lfrm=srp.0#18
* Visit SDCA Wiki: https://aws.highspot.com/items/640a3e0727d8c46afb6dd2e0?lfrm=srp.0#18
* Join the demo of SDCA CloudFormations & Terraform IAC Templates: https://gather.a2z.com/event/6eff0237-cb3d-4fc6-ac8e-9b49363a5368
* Join the Slack Channel: #wwso-security-gtm-sdca!
* Schedule an SDCA Office Hours Appointment: https://office-hour-scheduler.tools.aws.dev/schedule/d6a133c9-dc7d-4a9d-b27e-998b609141f3
* Tag “BD-Security-Driven-Cloud-Acceleration” on all relevant Opportunities and Activities. 
