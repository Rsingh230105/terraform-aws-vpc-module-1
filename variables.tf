variable "vpc_config" {
    description = "To get the CIDR and Name of VPC from user"
      
    type = object({
        cidr_block = string,
        vpc_name = string
      })
    
    validation {
      condition = can(cidrnetmask(var.vpc_config.cidr_block))
      error_message = "Invalide CIDR Format - ${var.vpc_config.cidr_block}"
    }
}

variable "subnet_config" {
    # sub1 = {cidr=.. az =..} sub2={}  sub3 ={}
    description = "To get the CIDR , AZ, and Name of Subnet from user"
      
    type =map(object({
        cidr_block = string,
        az = string
        public = optional(bool, false)
      }))

      validation {
      ## sib1 = {cidr=} sub2={}  sub3 ={}, [true, true, false]
      condition = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
      error_message = "Invalide CIDR Format - ${var.vpc_config.cidr_block}"
    }
}
