variable "vpc_name" {
  description = "Name of the vpc to gather data for"
}

variable "public_subnet_regex" {
  default = "public"
  description = <<EOF
    String to do a regex search on the Name tag that specifies public subnets
    The output also checks for map_public_ip_on_launch to be true and considers it a public subnet when false.
    `if s.map_public_ip_on_launch && regexall(var.public_subnet_regex, s.tags["Name"])`
  EOF
}

variable "db_subnet_regex" {
  default = "db"
  description = <<EOF
    String to do a regex search on the Name tag that specifies database subnets
    The output also checks for map_public_ip_on_launch to be false and considers it a private subnet when false.
    private db subnet conditional: `if regexall(var.db_subnet_regex, s.tags["Name"]) && !s.map_public_ip_on_launch`
    public db subnet conditional: `if regexall(var.db_subnet_regex, s.tags["Name"]) && !s.map_public_ip_on_launch`
  EOF
}

variable "private_subnet_regex" {
  default = "private"
  description = <<EOF
    String to do a regex search on the Name tag that specifies private subnets
    The output also checks for map_public_ip_on_launch to be false and considers it a private subnet when false.
    `if s.map_public_ip_on_launch && regexall(var.public_subnet_regex, s.tags["Name"])`
  EOF
}