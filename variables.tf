variable "vpc_config" {
  description = "VPC configuration: cidr_block and name"

  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR format in vpc_config: ${var.vpc_config.cidr_block}"
  }
}

variable "subnet_config" {
  description = "Map of subnet configurations: cidr_block, az, and optional public flag (default: false)"

  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))

  validation {
    condition     = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "One or more subnets have an invalid CIDR format. Please provide valid CIDR blocks."
  }
}
