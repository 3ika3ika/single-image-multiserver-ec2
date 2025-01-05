# CI/CD Pipeline for Docker Image

This repository contains a CI/CD pipeline configuration to automate the process of building, tagging, and deploying Docker images. The pipeline leverages GitHub Actions to handle integration with AWS ECR and deployment to an EC2 instance. Below is an overview of the workflow.

## Features

Trigger on Events:
Runs on push and pull_request events targeting the main branch.
Docker Image Build and Push:
Builds and tags a Docker image.
Pushes the image to Amazon Elastic Container Registry (ECR).
Deployment to EC2:
Transfers necessary files to an EC2 instance via SCP.
Deploys the Docker container using docker-compose.

## Prerequisites

Before using this pipeline, ensure the following are set up:

AWS ECR Repository:
> Replace docker/my-ecr-repo with your ECR repository name in the workflow.
AWS IAM Role:
> Ensure the IAM role arn:aws:iam::376129844985:role/<your-role-name> exists and has permissions to interact with ECR.

GitHub Secrets:
Add the following secrets to your repository:
> PRIVATE_SSH_KEY: The private SSH key for accessing the EC2 instance.Must be .pem file downloaded upon EC2 creation.
>
> AWS_ACCESS_KEY_ID
> 
> AWS_SECRET_ACCESS_KEY
  
EC2 Instance:
> Replace the hostname and username in the workflow (ec2-18-171-204-143.eu-west-2.compute.amazonaws.com and ec2-user) with your instance's values.

AWS Region:
> Update the aws-region and AWS_DEFAULT_REGION values to match your region.

## How to use

```bash
git clone https://github.com/3ika3ika/single-image-multiserver-ec2.git
```
```bash
cd single-image-multiserver-ec2
```
```bash
gh auth login 
gh repo create <my-github-repo> --private --description "My New Repo"
gh remote -v
gh remote remove origin
git remote add origin https://github.com/3ika3ika/single-image-multiserver-ec2.git
git init
git add .
git commit -m "My First Commit"
git push -u origin main
```
**Make sure to reference the correct github repo  within files in IAM roles (permissions, trust pocilicies) as well as in the ci-cd-pipeline.yaml file itself.**

This workflow provides an automated, robust pipeline to build, push, and deploy Docker images. Customize it as needed to fit your specific infrastructure and deployment requirements.

Let me know if you'd like additional details or modifications!
