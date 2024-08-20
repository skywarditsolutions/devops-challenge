resource "aws_launch_template" "this" {
  name                   = "${var.system}-${var.environment}-myApp"
  image_id               = data.aws_ami.ubuntu.id
  instance_type          = var.instance_size
  vpc_security_group_ids = [aws_security_group.this.id]

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = true
      volume_size           = var.root_volume_size_gb
      volume_type           = "gp2"
    }
  }

  user_data = base64encode(<<-EOF
                #!/bin/bash
                sudo apt-get update
                sudo apt-get install -y apache2
                sudo systemctl start apache2
              EOF
  )
}

resource "aws_autoscaling_group" "this" {
  name                = "${var.system}-${var.environment}-myapp"
  vpc_zone_identifier = data.aws_subnets.private.ids
  min_size            = 1
  max_size            = 3
  desired_capacity    = 2

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [data.aws_lb_target_group.myapp.arn]

  health_check_type         = "EC2"
  health_check_grace_period = 300
}

resource "aws_security_group" "this" {
  name   = "${var.system}-${var.environment}-ec2"
  vpc_id = data.aws_vpc.system.id

  ingress {
    from_port       = var.inbound_traffic_port
    to_port         = var.inbound_traffic_port
    protocol        = "tcp"
    security_groups = [data.aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.system}-${var.environment}-ec2"
  }
}