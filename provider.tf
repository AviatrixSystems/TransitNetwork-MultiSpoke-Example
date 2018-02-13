# Configure AWS provider access
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

# Configure Aviatrix provider access
provider "aviatrix" {
  controller_ip = "${var.controller_ip}"
  username = "${var.controller_username}"
  password = "${var.controller_password}"
}

