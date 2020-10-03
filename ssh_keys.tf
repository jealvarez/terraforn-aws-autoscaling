resource "aws_key_pair" "testing" {
  key_name   = "testing"
  public_key = file("${var.ssh_private_key_path}.pub")
}
