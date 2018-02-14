## Aviatrix account information
account_name ="aws-acct-name"
controller_ip = "x.y.z.w"
controller_username = "username"
controller_password = "secretpassword"

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
vgw_connection_name = "vgw_bgp_s2c_connection"
bgp_local_as = 6501
static_transit_gateway_name = "transit-static-gw"
# pre-defined in AWS
region = "us-west-2"
vgw_id = "vgw-69a50177"
static_transit_vpc_id = "vpc-bfc17cc6"
static_transit_subnet = "10.170.0.0/28"
static_transit_ha_subnet = "10.170.0.16/28"
