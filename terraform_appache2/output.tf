output "ipaddress" {
 value = "${aws_instance.apache2_ec2.public_ip}"
 sensitive = true 
}