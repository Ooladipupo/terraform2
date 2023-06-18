provider "aws" {
  region = "us-east-1"

}

# we need to creat an aws-vpc with the name "development
# we need to creat an aws-vpc with the name "development"

resource "aws_vpc" "development-vpc" {
  cidr_block       = "10.0.0.0/24"

  tags = {
    Name = "development-vpc"
  }
}
#next is to create an aws_subnet called dev-subnet-1
resource "aws_subnet" "dev-subnet-1" {
  vpc_id     = aws_vpc.development-vpc.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "us-east-1b"

  tags = {
    Name = "dev-subnet-1"
  }
}

output "dev-vpc-id" {
    value = "aws_vpc.development-vpc.id"
}

output "subnet-id" {
    value = "aws_subnet.dev-subnet-1.id"
}