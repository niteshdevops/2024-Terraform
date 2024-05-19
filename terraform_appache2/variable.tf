
variable "enviroment" {
    type = string
    description = "env name"
    default = "dev" 
}

variable "vpc_name" {
    type = string
    default = "default"
}

variable "subnet_prefix" {
    type = string
    default = "public"
}