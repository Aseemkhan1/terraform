resource "aws_key_pair" "awskeypair" {
  key_name = "awskeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
