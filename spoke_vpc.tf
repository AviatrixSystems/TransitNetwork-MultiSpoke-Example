# AWS Spoke VPCs
resource "aws_vpc" "spoke-VPC" {
    count = "${var.spoke_gateways}"
    cidr_block = "${var.spoke_prefix}.${count.index}.0/24"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "spoke-VPC-${count.index}"
    }
    depends_on = ["aviatrix_vgw_conn.test_vgw_conn"]
}

# AWS Public Subnets
resource "aws_subnet" "spoke-VPC-public" {
    count = "${var.spoke_gateways}"
    vpc_id = "${element(aws_vpc.spoke-VPC.*.id,count.index)}"
    cidr_block = "${var.spoke_prefix}.${count.index}.0/24"
    map_public_ip_on_launch = "true"

    tags {
        Name = "spoke-VPC-public-${count.index}"
    }
    timeouts {
    }
    depends_on = ["aviatrix_vgw_conn.test_vgw_conn"]
}

# AWS Internet GW
resource "aws_internet_gateway" "spoke-VPC-gw" {
    count = "${var.spoke_gateways}"
    vpc_id = "${element(aws_vpc.spoke-VPC.*.id,count.index)}"

    tags {
        Name = "spoke-VPC-gw-${count.index}"
    }
    timeouts {
    }
    depends_on = ["aviatrix_vgw_conn.test_vgw_conn"]
}

# AWS route tables
resource "aws_route_table" "spoke-VPC-route" {
    count = "${var.spoke_gateways}"
    vpc_id = "${element(aws_vpc.spoke-VPC.*.id,count.index)}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${element(aws_internet_gateway.spoke-VPC-gw.*.id,count.index)}"
    }
    tags {
        Name = "spoke-VPC-route-${count.index}"
    }
    lifecycle {
        ignore_changes=["route"]
    }
    depends_on = ["aviatrix_vgw_conn.test_vgw_conn"]
}

# AWS route associations public
resource "aws_route_table_association" "spoke-VPC-ra" {
    count = "${var.spoke_gateways}"
    subnet_id = "${element(aws_subnet.spoke-VPC-public.*.id,count.index)}"
    route_table_id = "${element(aws_route_table.spoke-VPC-route.*.id,count.index)}"
    depends_on = ["aws_subnet.spoke-VPC-public","aws_route_table.spoke-VPC-route","aws_internet_gateway.spoke-VPC-gw","aws_vpc.spoke-VPC","aviatrix_vgw_conn.test_vgw_conn"]
}

