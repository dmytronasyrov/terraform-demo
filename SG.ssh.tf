resource "aws_security_group" "allow-ssh" {
  name = "allow-ssh"
  description = "SG that allows SSH for my IP and all for all egress traffic"
  vpc_id = "${aws_vpc.main.id}"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["94.125.120.28/32"]
  }

  tags {
    Name = "allow-ssh"
  }
}