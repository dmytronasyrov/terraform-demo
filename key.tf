resource "aws_key_pair" "demo_access_key" {
  key_name   = "demo_access_key"
  public_key = "${file("${var.PATH_TO_PUB_KEY}")}"
}
