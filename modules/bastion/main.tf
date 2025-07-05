resource "aws_instance" "bastion" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = merge(var.tags, {
    Name = "jet-bastion"
  })
}

resource "aws_security_group" "bastion_sg" {
  name        = "jet-bastion-sg"
  description = "Allow SSH from your IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "jet-bastion-sg"
  })
}
