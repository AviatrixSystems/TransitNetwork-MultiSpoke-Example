# TransitNetwork-MultiSpoke-Example
A Terraform example to create multiple Spoke VPCs Transit Network

Pre-Requisites 
--------------
```sh
AWS Region (example: ca-central-1)
Transit VPC ID  (example: vpc-90cd28f8)
VGW ID (example: vgw-8dc54bbd)
```

User Parameters
---------------
 Persistent variable values are assign within this file named "terraform.tfvars" and automatically loads them to populate variables. 

Initialize terraform
--------------------
 This is one time command to initialize working directory containing Terraform configuration files. it is safe to run this command multiple times. 
```sh
$ terraform init
```

How to check terraform configuration files
------------------------------------------
```sh
$ terraform plan
```

How to run terraform scripts
----------------------------
```sh
$ terraform apply -auto-approve
```

How to cleanup all resources
----------------------------
```sh
$ terraform destroy -force
```
