resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  count         = 1
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = var.ssh_key_name

  security_groups = [
    aws_security_group.vault.id,
  ]

  associate_public_ip_address = true
  ebs_optimized               = false
  iam_instance_profile        = aws_iam_instance_profile.vault-kms-unseal.id

  tags = {
    Name = "${var.namespace}-${random_pet.env.id}-ssh"
  }

  user_data = data.template_file.bastion.rendered
}

data "template_file" "bastion" {
  template = file("bastion.tpl")

  vars = {
    vault_url  = var.vault_url
    aws_region = var.aws_region
    vault_address = var.vault_address
  }
}