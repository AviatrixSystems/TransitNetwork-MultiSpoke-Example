# Aviatrix Transit Network-MultiSpoke-Example
A Terraform example to create multiple Spoke VPCs Transit Network

Description
-----------
```sh
* Deploy transit network with multiple spoke gateways with HA enabled in single region.
* A variable named [spoke_gateways] will dictate the total number of spoke gateways.
* User will provide username and password for controller access.
* Create a new cloud account on Aviatrix controller for AWS cloud type.
* Assumes the VGW and transit VPC were created in advance. 
* Launches transit gateways with HA enabled.
* Create a VGW connection with transit VPC. 
* Create AWS VPCs based on [spoke_gateways] variable.
* Launches multiple aviatrix spoke gateways with HA enabled and attach to transit VPC.   
```
[Click here for AWS Global Transit Network Workflow Instructions](http://docs.aviatrix.com/HowTos/transitvpc_workflow.html)

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
# sample and pre-defined in AWS
region = "us-west-2"
vgw_id = "vgw-69a50177"
static_transit_vpc_id = "vpc-bfc17cc6"
static_transit_subnet = "10.170.0.0/28"
static_transit_ha_subnet = "10.170.0.16/28"
```
 variable to build multiple spoke gateways
```sh
spoke_gateways = 1
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
$ terraform validate
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
