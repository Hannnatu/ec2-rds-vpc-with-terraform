resource "aws_lb" "jet_alb" {
  name               = "jet-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnets

  tags = merge(var.tags, {
    Name = "jet-alb"
  })
}

resource "aws_security_group" "alb_sg" {
  name        = "jet-alb-sg"
  description = "Allow HTTP traffic from the internet"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "jet-alb-sg"
  })
}

resource "aws_lb_target_group" "jet_tg" {
  name     = "jet-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = merge(var.tags, {
    Name = "jet-target-group"
  })
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.jet_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jet_tg.arn
  }
}
