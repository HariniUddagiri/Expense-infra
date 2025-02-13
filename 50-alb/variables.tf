variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "commontags" {
  default = {
    Name="Expense"
    environment="dev"
    terraform="true"
  }
}

variable "zone_id" {
  default = "Z04565822MZZ4WTDMXZ1A"

  
}

variable "domain_name" {
  default = "daws82s.store"
}