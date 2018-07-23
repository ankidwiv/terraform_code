resource "aws_instance" "my-instances" {
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.ssh_key}"
  user_data              = "${file("install.sh")}"
  subnet_id              = "${element(aws_subnet.Public_subnet.*.id, count.index%length(var.Public_subnet_cidrs))}"
  vpc_security_group_ids = ["${aws_security_group.Bastion_SG.id}"]

  tags {
    Name = "Terraform-${count.index +1}"
  }
}
