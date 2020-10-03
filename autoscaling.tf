resource "aws_launch_template" "web_server" {
  image_id               = "ami-088c153f74339f34c"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.testing.id
  vpc_security_group_ids = [aws_security_group.web_server.id]
  user_data = filebase64("./configuration/configure.sh")
}

resource "aws_autoscaling_group" "web_servers_autoscaling_group" {
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 3
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
  target_group_arns= [aws_lb_target_group.alb_target_group.arn]
    launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }  
}
