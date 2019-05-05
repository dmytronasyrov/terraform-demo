resource "aws_security_group" "allow-http" {
  name = "allow-http"
  description = "SG that allows HTTP for all ingress traffic and all for all egress traffic"
  vpc_id = "${aws_vpc.main.id}"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow-http"
  }
}