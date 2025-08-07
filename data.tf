data "aws_vpc" "requester" {
  #Argument to do filtering  
  id = var.vpc_requester_id
}

data "aws_vpc" "accepter" {
  #Argument to do filtering  
  id = var.vpc_accepter_id
}
