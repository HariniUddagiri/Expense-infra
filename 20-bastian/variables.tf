variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "commontags" {
  default = {
    Name="bastian"
    project="expense"
    environment="dev"
    Terraform=true
  }
}