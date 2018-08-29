
#jenkins
resource "aws_instance" "jenkins" {
  ami           = "ami-01184800526c72543"
  instance_type = "t2.micro"
  tags {
    Name = "jenkins"
    Env = "Inda"
  }

  # the VPC subnet
  subnet_id = "${aws_subnet.test-public-2.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.WebSG.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.awskeypair.key_name}"
}

