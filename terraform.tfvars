## Aviatrix account information
avx_account_name ="aws-acct-name"
avx_controller_ip = "x.y.z.w"
avx_controller_username = "username"
avx_controller_password = "secretpassword"

## AWS Account information
aws_account_number = "123456789102"
aws_access_key = "xxxxxxxxxxxxxxxxxxx"
aws_secret_key = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
aws_iam = "true"
aws_role_arn = "arn:aws:iam::123456789102:role/aviatrix-role-app"
aws_role_ec2 = "arn:aws:iam::123456789102:role/aviatrix-role-ec2"

## Aviatrix transit network parameters
## modify spoke_gateways to build multiple spoke GWs
#
spoke_gateways = 1
spoke_prefix = "10.1"
spoke_region = "us-east-2"
vgw_connection_name = "vgw_bgp_s2c_connection"
bgp_local_as = 6501
static_transit_gateway_name = "transit-static-gw"
transit_ec2_instance = "t2.micro"
spoke_ec2_instance = "t2.micro"

# pre-defined in AWS
vgw_id = "vgw-08005b4d"
static_transit_region = "us-west-1"
static_transit_vpc_id = "vpc-4d73882a"
static_transit_public_subnet = "172.23.0.0/24"
static_transit_public_ha_subnet = "172.23.0.0/24"
