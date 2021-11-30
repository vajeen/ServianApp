## IaC with Terraform for TechChallengeApp

### Getting started
Clone the repository
checkout iac branch
```
git checkout iac
```

Initialize Terraform
```
terraform init
```

Apply config
```
terraform apply
```

### Details
This will create following resources
- Default network
- Default subnet
- Cloud VM (Target to host the application) - app1
- CloudSQL Postgres Instance - pg1

Makesure to set the credentials of postgress with google_sql_user

