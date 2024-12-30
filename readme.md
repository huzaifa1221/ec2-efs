This code creates the following resources :

1. 2 ec2-identical servers using "ec2" module
2. 1 sg for ec2
3. 1 efs
4. 1 sg for efs
5. efs mount target in availability zone us-east-1d
6. iam role to provide ec2 access to communicate with efs

* backend is configured as s3 bucket for storage of tfstate files.


This setup will allow us to create multiple ec2 instances using the ec2 module with common efs pre-configured using shell script that runs during the provisioning of the instances.
currently this is possible in the availability zone us-east-1d. to make it available for multiple zones within a vpc and more mount targets !!
