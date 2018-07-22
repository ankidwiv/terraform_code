resource "aws_nat_gateway" "Nat_gateway" {
 count = "${length(var.Private_subnet_cidrs)}"
 allocation_id = "${element(aws_eip.Nat_eip.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.Private_subnet.*.id, count.index)}"

  tags {
    Name = "Nat-gateway-${count.index +1}"
  }
}

