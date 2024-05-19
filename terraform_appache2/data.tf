data "aws_vpc" "myvpc" {
    filter {
    name = "tag:Name"
    values = [ "${var.vpc_name}" ]
    }
}

data "aws_subnet" "public_subnet" {
    vpc_id = data.aws_vpc.myvpc.id
    filter {
        name = "tag:Name"
        values = [ "${var.subnet_prefix}*" ]
    } 
}