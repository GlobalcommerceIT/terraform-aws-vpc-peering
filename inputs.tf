variable "name" {
  description = "The name of the solution/project. It will be used togeter domain variable to build the FQDN (or domain_name)"
}

variable "stage" {
  description = "The type of environment. ie: int, qa, stagin, production"
}

variable "vpc_requester_id" {
  description = ""
}

variable "requester_route_table_ids" {
  type        = list
  description = ""
}

variable "vpc_accepter_id" {
  description = ""
}

variable "accepter_route_table_ids" {
  type        = list
  description = ""
}

variable "allow_remote_vpc_dns_resolution" {
  type        = bool
  description = ""
  default     = false
}

