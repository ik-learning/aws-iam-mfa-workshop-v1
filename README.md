# MFA not enought to protect your account

Do not commit outputs. It may containt AWS Secrets

[Explanation](https://medium.com/@tanzwud.work/protect-aws-account-with-group-and-assume-role-when-mfa-is-not-enough-913c9948532d)

## Commands used in workshop

```
aws ec2 describe-instances --profile developer --region eu-west-1 --query 'Reservations[].Instances[].Tags[?Key==`Environment`]'
aws ec2 describe-instances --profile developer_v2 --region eu-west-1 --query 'Reservations[].Instances[].Tags[?Key==`Environment`]'
aws ec2 describe-instances --profile developer_assume_role --region eu-west-1 --query 'Reservations[].Instances[].Tags[?Key==`Environment`]'
```

