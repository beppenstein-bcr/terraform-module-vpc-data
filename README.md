## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| db\_subnet\_regex | String to do a regex search on the Name tag that specifies database subnets<br>    The output also checks for map\_public\_ip\_on\_launch to be false and considers it a private subnet when false.<br>    private db subnet conditional: `if regexall(var.db_subnet_regex, s.tags["Name"]) && !s.map_public_ip_on_launch`<br>    public db subnet conditional: `if regexall(var.db_subnet_regex, s.tags["Name"]) && !s.map_public_ip_on_launch` | `string` | `"db"` | no |
| private\_subnet\_regex | String to do a regex search on the Name tag that specifies private subnets<br>    The output also checks for map\_public\_ip\_on\_launch to be false and considers it a private subnet when false.<br>    `if s.map_public_ip_on_launch && regexall(var.public_subnet_regex, s.tags["Name"])` | `string` | `"private"` | no |
| public\_subnet\_regex | String to do a regex search on the Name tag that specifies public subnets<br>    The output also checks for map\_public\_ip\_on\_launch to be true and considers it a public subnet when false.<br>    `if s.map_public_ip_on_launch && regexall(var.public_subnet_regex, s.tags["Name"])` | `string` | `"public"` | no |
| vpc\_name | Name of the vpc to gather data for | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_database\_subnet\_ids | This is a set(string) which can be used of for\_each loops on resources<br>    To use these as a list you must convert from type set to type list with tolist() |
| private\_route\_table\_ids | This is a set(string) which can be used of for\_each loops on resources<br>    To use these as a list you must convert from type set to type list with tolist() |
| private\_route\_tables | Type: Map of Maps - A map of all private route\_table data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/route_table.html) |
| private\_subnet\_ids | This is a set(string) which can be used of for\_each loops on resources<br>    To use these as a list you must convert from type set to type list with tolist() |
| public\_database\_subnet\_ids | This is a set(string) which can be used of for\_each loops on resources<br>    To use these as a list you must convert from type set to type list with tolist() |
| public\_route\_table\_ids | This is a set(string) which can be used of for\_each loops on resources<br>    To use these as a list you must convert from type set to type list with tolist() |
| public\_route\_tables | Type: Map of Maps - A map of all public route\_table data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/route_table.html) |
| public\_subnet\_ids | This is a set(string) which can be used of for\_each loops on resources<br>    To use these as a list you must convert from type set to type list with tolist() |
| route\_table\_ids | This is a set(string) which can be used of for\_each loops on resources<br>    To use these as a list you must convert from type set to type list with tolist() |
| security\_group\_ids | This is a set(string) which can be used of for\_each loops on resources<br>    To use these as a list you must convert from type set to type list with tolist() |
| security\_groups | Type: Map of Maps - A map of all public route\_table data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/security_group.html) |
| vpc | Type: Map - A map of vpc data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/vpc.html) |
| vpc\_cidr\_block | The VPC CIDR block |
| vpc\_id | VPC ID |
| vpc\_subnets | Type: Map of Maps - A map of all subnet data [Terraform Doc](https://www.terraform.io/docs/providers/aws/d/subnet.html) |

