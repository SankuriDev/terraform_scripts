#region
aws_region = "ap-south-1"

#VPC
vpc_name = "testsetup1-vpc"
vpc_cidr = "10.18.0.0/16"
vpc_environment = "dev"

#IG
IGW_name = "testsetup1-IGW"

#public-subnet1
public_subnet1_name = "testsetup1-public-subnet-1"
pulic_subnet1_cidr = "10.18.1.0/24"

#public-subnet2
public_subnet2_name = "testsetup1-public-subnet-2"
pulic_subnet2_cidr = "10.18.2.0/24"

#Routing-table
Main_Routing_Table = "testsetup1-rt"

#ec2
aws_ami = "ami-02d26659fd82cf299"
instance_type = "t2.micro"
aws_key_name = "k8s_key_stark"

#route53 hosted zone
hosted_zone_id="Z00545283S1GN1FPNKXY9"
nlb_alias_name  = "day.k8sn1.xyz"


