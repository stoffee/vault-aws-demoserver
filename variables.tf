variable "aws_region" {
  default = "us-west-2"
}

variable "aws_zone" {
  default = "us-west-2a"
}

variable "aws_zone-2" {
  default = "us-west-2b"
}

variable "vault_url" {
  default = "https://releases.hashicorp.com/vault/1.11.2/vault_1.11.2_linux_amd64.zip"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR of the VPC"
  default     = "192.168.100.0/24"
}

variable "db_address" {
  description = "address of the DB server"
  default     = "aws_db_instance.proddb.address"
}

variable "vault_db_address" {
  description = "address of the vault DB server"
  default     = "aws_db_instance.vault.address"
}

variable "vault_address" {
  description = "address of the vault ssh host"
  default     = "aws_instance.vault[0].public_ip"
}

variable "namespace" {
  description = "Prepended name of all resources"
  default     = "vault-db-ssh"
}

variable "proddb_username" {
  default = "dbaccount"
}

variable "proddb_password" {
  default = "UseHashiCorpVault"
}

variable "vaultdb_username" {
  default = "vaultdbadmin"
}

variable "vaultdb_password" {
  default = "UseHashiCorpVault"
}

variable "owner" {
  default = "hashicorp"
}

variable "ssh_key_name" {
  default = "my-aws-ssh-key"
}

variable "instance_type" {
  default = "t2.micro"
}
