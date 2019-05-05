resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  subnet_id = "${aws_subnet.main-public-1.id}"

  vpc_security_group_ids = [
    "${aws_security_group.allow-ssh.id}",
    "${aws_security_group.allow-http.id}",
  ]

  key_name = "${aws_key_pair.demo_access_key.key_name}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ips"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    type        = "ssh"
    user        = "${var.INSTANCE_USERNAME}"
    agent       = false
    private_key = "${file("${var.PATH_TO_PRIV_KEY}")}"
    timeout     = "10m"
  }
}

output "ip" {
  value = "${aws_instance.example.public_ip}"
}
