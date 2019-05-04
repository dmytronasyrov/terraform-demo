resource "aws_key_pair" "demo_access_key" {
  key_name = "demo_access_key"
  public_key = "${file("${var.PATH_TO_PUB_KEY}")}"
}

resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.demo_access_key.key_name}"

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    type = "ssh"
    user = "${var.INSTANCE_USERNAME}"
    agent = false
    private_key = "${file("${var.PATH_TO_PRIV_KEY}")}"
    timeout = "10m"
  }
}