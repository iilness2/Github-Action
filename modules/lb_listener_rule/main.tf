resource "aws_lb_listener_rule" "main80" {
  listener_arn = "${var.target_listner80}"
  priority     = "${var.priority}"

  action {
    type             = "forward"
    target_group_arn = "${var.target_group_arn}"
  }

  condition {
    field  = "host-header"
    values = ["${var.host}"]
  }
}

resource "aws_lb_listener_rule" "main443" {
  listener_arn = "${var.target_listner443}"
  priority     = "${var.priority}"

  action {
    type             = "forward"
    target_group_arn = "${var.target_group_arn}"
  }

  condition {
    field  = "host-header"
    values = ["${var.host}"]
  }
}
