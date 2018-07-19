resource "aws_subnet" "Public_subnet" {
  vpc_id                  = "${aws_vpc.My_Vpc.id}"
  cidr_block              = "${lookup(var.cidr_blocks, concat("zone", count.index))}"
  map_public_ip_on_launch = 1
  availability_zone       = "${lookup(var.zones, concat("zone", count.index))}"

  tags {
    name = " Public_subnet "
  }
}

