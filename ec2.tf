resource "aws_security_group" "awx" {
  name = "awx"
  description = "security group for awx"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["92.51.249.9/32"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["92.51.249.9/32"]
  }

  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.awx.id}"
}

resource "aws_instance" "awx1" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "terraform_ec2_key"
  user_data = "${file("deploy/install_awx.sh")}"
  security_groups = ["${aws_security_group.awx.id}"]
  subnet_id = "${aws_subnet.subnet7.id}"
  associate_public_ip_address = true

  tags = {
      Name = "AWX-APP"
    }
}

resource "aws_instance" "awx2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "terraform_ec2_key"
  security_groups = ["${aws_security_group.awx.id}"]
  subnet_id = "${aws_subnet.subnet6.id}"
  associate_public_ip_address = false
  tags = {
      Name = "AWX-DB"
    }
}

resource "aws_key_pair" "terraform_ec2_key" {
  key_name = "terraform_ec2_key"
  public_key = "${file("terraform_ec2_key.pub")}"
}
