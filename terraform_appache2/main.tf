
resource "aws_instance" "apache2_ec2" {
    ami = "ami-04b70fa74e45c3917"
   associate_public_ip_address = true
   instance_type = "t2.micro"
   key_name = "terraform"
   vpc_security_group_ids = [ "${aws_security_group.apache2.id}" ]
   subnet_id = "${data.aws_subnet.public_subnet.id}"
   tags =  {
    Name = "HelloWorld"
  }
  user_data = <<EOF
#!/bin/bash
sudo apt-get update 
sudo apt-get install apache2 -y 

EOF
}

resource "aws_security_group" "apache2" {
  name = "myapache2-sg"
  description = "apache2 ports and ssh open"
  vpc_id = data.aws_vpc.myvpc.id

  tags = {
    "enviroment" = var.enviroment
  }

  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

}