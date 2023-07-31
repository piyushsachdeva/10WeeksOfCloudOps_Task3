# 🚀 Challenge 3 as part of #10WeeksofCloudOps - 2 tier Application using terraform 

✨This repository is created to learn and deploy  2-tier application on aws cloud through terraform. 

## 🏠 Architecture
#![Architecture of the application]()

## 🖥️ Installation of Terraform

**Note**: Follow blog to Install the Terraform and other dependency. [Terrafrom]()

### Create S3 Backend Bucket
Create an S3 bucket to store the tfstate file in remote backend

**Warning!** It is highly recommended that you `enable Bucket Versioning` on the S3 bucket to allow for state recovery in the case of accidental deletions and human error.

**Note**: We will need this bucket name in the later step

### Create a Dynamo DB table for state file locking
- Give the table a name
- Make sure to add a `Partition key` with name as `LockID` and type as `String`

### Generate a public private key-pair for our instances
we need public key and private key for our server so follow below procedure.

```sh
cd modules/key/
ssh-keygen
```
above command ask for key name then give `client_key` it will create pair of keys one public and one private. you can give any name you want but then you need to edit the terraform file

edit below file accoding to your configuration
```sh
vim root/backend.tf
```
add below code in root/backend.tf
```sh
terraform {
  backend "s3" {
    bucket = "BUCKET_NAME"
    key    = "backend/FILE_NAME_TO_STORE_STATE.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamoDB_TABLE_NAME"
  }
}
```
### 🏠Lets setup the variable for our Infrastructure
create one file with the name of `terraform.tfvars` 
```sh
vim root/terraform.tfvars
```
### ACM certificate
Go to AWS console --> AWS Certificate Manager (ACM) and make sure you have a valid certificate in Issued status, if not , feel free to create one and use the domain name on which you are planning to host your application.

### Route 53 Hosted Zone
Go to AWS Console --> Route53 --> Hosted Zones and make sure you have a public hosted zone available, if not create one.

add below contents into `root/terraform.tfvars` file and add the values of each variables
```javascript
region = ""
project_name = ""
vpc_cidr                = ""
pub_sub_1a_cidr        = ""
pub_sub_2b_cidr        = ""
pri_sub_3a_cidr        = ""
pri_sub_4b_cidr        = ""
pri_sub_5a_cidr        = ""
pri_sub_6b_cidr        = ""
db_username = ""
db_password = ""
certificate_domain_name = ""
additional_domain_name = ""


```

## ✈️ Now we are ready to deploy our application on cloud ⛅
get into project directory 
```sh
cd root
```
👉 let install dependency to deploy the application 

```sh
terraform init 
```

Type below command to see plan of the exection 
```sh
terraform plan
```

✨Finally, HIT the below command to deploy the application...
```sh
terraform apply 
```

type `yes`, it will prompt you for approval..

**Thank you so much for reading..😅**
