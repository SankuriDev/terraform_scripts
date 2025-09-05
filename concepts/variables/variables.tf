variable "aws_region" {
    description = "This is which region we are deploying our instance"
    default = "ap-south-1"
}

variable "ami_id" {
    description = "we are using aws ami id which is available in resgion we are using"
    default = "ami-02d26659fd82cf299"
}

variable "instance_type" {
    description = "hear we mention whicg instance type we are using"
    default = "t2.micro"
}