resource "aws_subnet" "Public_subnet" {
  vpc_id                  = "${aws_vpc.My_Vpc.id}"
  cidr_block              = "${element(var.cidr_blocks, 0)}"
  map_public_ip_on_launch = 1
  availability_zone       = "${element(lookup(var.AZ, var.aws_region), 0)}"

  tags {
    name = " Public_subnet "
  }
}
