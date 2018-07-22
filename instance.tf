resource "aws_instance" "my-instances" {
  count         = "${var.instance_count}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.ssh_key}"

  tags {
    Name = "Terraform-${count.index +1}"
  }
}
