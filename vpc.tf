#Creating VPC 
resource "aws_vpc" "My_Vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = 1
  enable_dns_hostnames = 1

  tags {
    name = "My_Vpc"
  }
}


#Creating Public subnets

resource "aws_subnet" "Public_subnet" {
    count = "${length(var.Public_subnet_cidrs)}"
  vpc_id                  = "${aws_vpc.My_Vpc.id}"
  cidr_block              = "${element(var.Public_subnet_cidrs, count.index )}"
  map_public_ip_on_launch = 1
  availability_zone       = "${element(var.AZ, count.index)}"

  tags {
    name = "Public_subnet-${count.index +1}"
  }
}



