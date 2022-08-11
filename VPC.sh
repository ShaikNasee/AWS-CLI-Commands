# ! /bin/bash


aws ec2 create-vpc --cidr-block '192.168.0.0/16' --tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=ntier}]"
#  "VpcId": "vpc-0ddbd5370e582437d",

aws ec2 create-subnet --cidr-block '192.168.0.0/24' --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=web1}]" --vpc-id "vpc-0ddbd5370e582437d" --availability-zone "us-west-2a"
# "subnet-0429ff4243b26c337",

aws ec2 create-subnet --cidr-block '192.168.1.0/24' --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=web2}]" --vpc-id "vpc-0ddbd5370e582437d" --availability-zone "us-west-2b"
# "subnet-0e847640dc56012f9",

aws ec2 create-subnet --cidr-block '192.168.2.0/24' --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=app1}]" --vpc-id "vpc-0ddbd5370e582437d" --availability-zone "us-west-2c"
# "subnet-041c9a675b1e55330",

aws ec2 create-subnet --cidr-block '192.168.3.0/24' --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=app2}]"--vpc-id "vpc-0ddbd5370e582437d" --availability-zone "us-west-2d"
# "subnet-04ccdd031a372eab2",

aws ec2 create-subnet --cidr-block '192.168.4.0/24' --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=db1}]"--vpc-id "vpc-0ddbd5370e582437d" --availability-zone "us-west-2a"
# "subnet-0ade498b8daf437da",

aws ec2 create-subnet --cidr-block '192.168.5.0/24' --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=db2}]"--vpc-id "vpc-0ddbd5370e582437d" --availability-zone "us-west-2b"
#  "subnet-02a38074440705c7a",

# Now crearte an internet-gateway and attached it to the VPC

aws ec2 create-internet-gateway --tag-specifications "ResourceType=internet-gateway,Tags=[{Key=Name,Value=myIGW}]" 
#  "igw-088be51acc86fc946"

aws ec2 attach-internet-gateway --internet-gateway-id 'igw-088be51acc86fc946' --vpc-id "vpc-0ddbd5370e582437d"
# Attached to the VPC

# Creating the private and public route tables 

aws ec2 create-route-table --vpc-id 'vpc-0ddbd5370e582437d' --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=public}]"
#  "RouteTableId": "rtb-07838e0aebb12a618",

aws ec2 create-route-table --vpc-id 'vpc-0ddbd5370e582437d' --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=private}]"
# "RouteTableId": "rtb-0a022a0a35316dbcf",
aws ec2 associate-route-table --route-table-id 'rtb-07838e0aebb12a618' --subnet-id 'subnet-0429ff4243b26c337'
