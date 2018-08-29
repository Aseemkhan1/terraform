variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "ap-southeast-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-43a15f3e"
    us-west-2 = "ami-4e79ed36"
    ap-southeast-1 = "ami-04c6ea3c0875d07a9"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "aws"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "aws.pub"
}
