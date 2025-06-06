aws configure get region
aws configure list

# AWS CLI: Create Security Group and Add Rules
aws ec2 describe-vpcs

# Replace vpc-xxxxxxxx with your actual VPC ID from above command
# Create a security group
aws ec2 create-security-group \
  --group-name elastic-stack-sg \
  --description "Allow SSH, Elasticsearch (9200), and Kibana (5601)" \
  --vpc-id vpc-003543f4a92e51a13
  # --vpc-id vpc-xxxxxxxxxxxxxxxxx

# Add Inbound Rules

# Allow SSH from your local network
aws ec2 authorize-security-group-ingress \
  --group-name elastic-stack-sg \
  --protocol tcp \
  --port 22 \
  --cidr 192.168.0.0/24

# Allow Elasticsearch (port 9200)
aws ec2 authorize-security-group-ingress \
  --group-name elastic-stack-sg \
  --protocol tcp \
  --port 9200 \
  --cidr 192.168.0.0/24

# Allow Kibana (port 5601)
aws ec2 authorize-security-group-ingress \
  --group-name elastic-stack-sg \
  --protocol tcp \
  --port 5601 \
  --cidr 192.168.0.0/24

# Get Security Group ID from Name
aws ec2 describe-security-groups \
  --filters Name=group-name,Values=elastic-stack-sg \
  --query 'SecurityGroups[0].GroupId' \
  --output text



# Start EC2
# Step 1: Find Amazon Linux 2023 AMI ID
# Run this to get the latest AL2023 AMI in your region:

aws ec2 describe-images \
  --owners amazon \
  --filters "Name=name,Values=al2023-ami-*-x86_64" "Name=architecture,Values=x86_64" \
  --query "Images | sort_by(@, &CreationDate) | [-1].ImageId" \
  --output text
# ✅ Note the AMI ID from the output (e.g., ami-0abcdef1234567890)

# Step 2: Launch the Instance
# Replace:
#     ami-xxxxxxxxxxxxxxxxx → the AMI ID you got above
#     my-keypair → your SSH key name (must already exist in AWS)
#     my-security-group-id → your existing security group ID (must allow SSH port 22)

aws ec2 run-instances \
  --image-id ami-xxxxxxxxxxxxxxxxx \
  --instance-type t2.micro \
  --key-name my-keypair \
  --security-group-ids sg-xxxxxxxxxxxxxxxxx \
  --user-data file://install-docker.sh \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=AL2023-Docker}]'


aws ec2 run-instances \
  --image-id ami-0d985f0685c642bd9 \
  --instance-type t2.micro \
  --key-name Mumbai \
  --security-group-ids sg-0f64a070daa1715b8 \
  --user-data file://docker_user_data.sh \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=AL2023-Docker}]'  

