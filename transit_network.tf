# Sample Aviatrix terraform configuration to create complete transit network solution
#
# This configuration creates the following:
# 1. Assumes AWS and Aviatrix controller access is ready.
# 2. Launches transit VPC and Gateway.
# 3. Creates VGW connection with transit VPC.
# 4. Launches a spoke GW, and attach with transit VPC.
#
#
# NOTE: During terraform destroy it will delete spoke gateways before AWS cleanup
#
#
 
 
# Create transit VPC
# Omit ha_subnet to launch transit VPC without HA.
# ha_subnet can be later added or deleted to enable/disable HA in transit VPC
 
resource "aviatrix_transit_vpc" "test_transit_gw" {
  cloud_type = 1
  account_name = "${var.avx_account_name}"
  gw_name= "${var.static_transit_gateway_name}"
  vpc_id = "${var.static_transit_vpc_id}"
  vpc_reg = "${var.static_transit_region}"
  vpc_size = "${var.transit_ec2_instance}"
  subnet = "${var.static_transit_public_subnet}"
  ha_subnet = "${var.static_transit_public_ha_subnet}"
}
 
# Create VGW connection with transit VPC.
resource "aviatrix_vgw_conn" "test_vgw_conn" {
  conn_name = "${var.vgw_connection_name}"
  gw_name = "${var.static_transit_gateway_name}"
  vpc_id = "${var.static_transit_vpc_id}"
  bgp_vgw_id = "${var.vgw_id}"
  bgp_local_as_num = "${var.bgp_local_as}"
  depends_on = ["aviatrix_transit_vpc.test_transit_gw"]
}
 
# Launch a spoke VPC, and join with transit VPC.
# Omit ha_subnet to launch spoke VPC without HA.
# ha_subnet can be later added or deleted to enable/disable HA in spoke VPC

resource "aviatrix_spoke_vpc" "test_spoke" {
  count = "${var.spoke_gateways}"
  account_name = "${var.avx_account_name}"
  cloud_type = 1
  gw_name= "myspoke-GW-${count.index}"
  vpc_id = "${element(aws_vpc.spoke-VPC.*.id,count.index)}"
  vpc_reg = "${var.spoke_region}"
  vpc_size = "${var.spoke_ec2_instance}"
  subnet = "${element(aws_subnet.spoke-VPC-public.*.cidr_block,count.index)}"
  ha_subnet = "${element(aws_subnet.spoke-VPC-public.*.cidr_block,count.index)}"
  transit_gw = "${var.static_transit_gateway_name}"
  depends_on = ["aviatrix_vgw_conn.test_vgw_conn","aviatrix_transit_vpc.test_transit_gw","aws_route_table_association.spoke-VPC-ra"]
}

