# MFA not enought to protect your account

Do not commit outputs. It may containt AWS Secrets


## Commands used in workshop

```
aws ec2 describe-instances --profile developer --region eu-west-1 --query 'Reservations[].Instances[].Tags[?Key==`Environment`]'
aws ec2 describe-instances --profile developer_v2 --region eu-west-1 --query 'Reservations[].Instances[].Tags[?Key==`Environment`]'
aws ec2 describe-instances --profile developer_assume_role --region eu-west-1 --query 'Reservations[].Instances[].Tags[?Key==`Environment`]'
```

