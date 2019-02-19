# Getting Started

## Step 1 - Build Java and JavaScript Artifacts

```mvn clean install``` 

## Step 2 - Configure Environment

Create environment variable `TF_VAR_account_id` to specify AWS Account ID 

```
export TF_VAR_account_id=???
```

Ensure AWS CLI (command line interface) is installed and configured.

You should have `~/.aws/config` file similar to below (specified preferred region):
```
[default]
region = eu-west-1
```

Also should have `~/.aws/credentials ` file with AWS credentials:
```
[default]
aws_access_key_id = ???
aws_secret_access_key = ???
```

You will get the AWS credentials from AWS IAM.

## Step 3 - Deploy to AWS

Change directory into the terraform source directory:

```
cd kl-aws-lambda-terraform-example/src/main/terraform
```

To deploy to AWS run: 

```
terraform apply
```

To tear down and delete all AWS entities create previously: 

```
terraform destroy
```