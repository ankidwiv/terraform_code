resource "aws_instance" "my-instances" {
  count         = "${var.instance_count}"
  ami           = "${lookup(var.ami, var.aws_region)}"
  instance_type = "${var.instance_type}"
  key_name      = "${lookup(var.ssh_key, var.aws_region)}"

  tags {
    Name = "Terraform-${count.index}"
  }
}
