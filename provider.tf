# Configure AWS provider access
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.spoke_region}"
}

# Configure Aviatrix provider access
provider "aviatrix" {
  controller_ip = "${var.avx_controller_ip}"
  username = "${var.avx_controller_username}"
  password = "${var.avx_controller_password}"
}

