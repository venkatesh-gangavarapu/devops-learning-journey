# Day 3 - AWS Fundamentals, EC2 & CloudWatch

## Summary
- Created IAM group/user and attached DevOps policies
- Launched EC2 (Ubuntu 24.04) with key pair and assigned IAM role
- SSH'd into instance, installed Nginx and deployed a simple HTML page
- Installed Amazon CloudWatch Agent, added custom config to stream /var/log/syslog and nginx access log
- Verified CloudWatch logs and metics in AWS Console

## Files
- `DAY 3 — AWS FUNDAMENTALS + IAM + EC2 + HANDS-ON DEPLOYMENT` - Document for practice
- `cloudwatch-agent-config.json` - CloudWatch agent config (logs & metrics)
- `ec2-commands.txt` - commands run on EC2 (SSH, nginx setup, test commands)
- `README.md` - this file

## How to verify
1. SSH: `ssh -i devops-key.pem ubuntu@<ec2-public-ip>`
2. Check nginx: visit `http://<ec2-public-ip>`
3. CloudWatch logs: Console -> CloudWatch -> Logs -> Log group `ec2-syslog` and `nginx-access-log`

## Interview Questions
- Q1: What is IAM Role vs IAM User?
- Q2: What is Security Group?
- Q3: Difference between Public vs Private Subnet?
- Q4: How do you SSH into EC2?
- Q5: What is Elastic IP?
- Q6: What is AMI?
- Q7: How do you resrict SSH access?
- Q8: What is Auto Scaling?
- Q9: What is CloudWatch?
- Q10: What is EC2 User Data?
- Q11: How to reduce EC2 Cost?
- Q12: What is Key pair?
- Q13: What is VPC?
- Q14: What is Route Table?
- Q15: What is Instance profile?
- Q16: Where are EC2 logs stored?
- Q17: What is ELB?
- Q18: How do you monitor CPU usage?
- Q19: What is EBS?
- Q20: Why do DevOps engineers prefer Linux for EC2?

