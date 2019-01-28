/**
resource "aws_elb" "uatauto1-elb" {
  name = "uatauto1-elb"
  subnets = ["${aws_subnet.uatauto1-public-1.id}", "${aws_subnet.uatauto1-public-2.id}"]
  security_groups = ["${aws_security_group.uatauto1-WebSG.id}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 443
    lb_protocol = "https"
    ssl_certificate_id = "arn:aws:acm:us-west-2:xxxxxxxxxxx:certificate/70b75f31-ab16-49a3-b311-77e02357bc04"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "uatauto1-elb"
  }
}
**/
