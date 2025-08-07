resource "aws_vpc_peering_connection" "this" {
  peer_vpc_id = var.vpc_accepter_id
  vpc_id      = var.vpc_requester_id
  auto_accept = true
  tags = {
    Name = "vpc_peer_conn-${var.name}-${var.stage}"
  }

  accepter {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution
  }
  requester {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution
  }
}

resource "aws_route" "accepter_route_table" {
  depends_on = [aws_vpc_peering_connection.this]
  count      = length(var.accepter_route_table_ids)

  route_table_id            = element(var.accepter_route_table_ids, count.index)
  destination_cidr_block    = data.aws_vpc.requester.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id

}

resource "aws_route" "requester_route_table" {
  depends_on = [aws_vpc_peering_connection.this]
  count      = length(var.requester_route_table_ids)

  route_table_id            = element(var.requester_route_table_ids, count.index)
  destination_cidr_block    = data.aws_vpc.accepter.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id

}
