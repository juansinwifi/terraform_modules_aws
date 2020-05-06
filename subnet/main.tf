resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
  tags = var.tags
  map_public_ip_on_launch = var.ip_on_launch
}