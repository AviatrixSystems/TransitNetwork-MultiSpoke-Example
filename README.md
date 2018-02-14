# Aviatrix TransitNetwork-MultiSpoke-Example
A Terraform example to create multiple Spoke VPCs Transit Network

Pre-Requisites 
--------------
```sh
AWS Region (example: us-west-2)
Transit VPC ID  (example: vpc-90cd28f8)
VGW ID (example: vgw-8dc54bbd)
```

User parameters
---------------
 Persistent variable values are assign within this file named "terraform.tfvars" and automatically loads them to populate variables. 
```sh
# pre-defined in AWS
region = "us-west-2"
vgw_id = "vgw-69a50177"
static_transit_vpc_id = "vpc-bfc17cc6"
static_transit_subnet = "10.170.0.0/28"
static_transit_ha_subnet = "10.170.0.16/28"
```

Initialize terraform
--------------------
 This is one time command to initialize working directory containing Terraform configuration files. It is safe to run this command multiple times. 
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
