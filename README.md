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
Replace docker/my-ecr-repo with your ECR repository name in the workflow.
AWS IAM Role:
Ensure the IAM role arn:aws:iam::376129844985:role/github-actions-cicd exists and has permissions to interact with ECR.
GitHub Secrets:
Add the following secrets to your repository:
PRIVATE_SSH_KEY: The private SSH key for accessing the EC2 instance.
EC2 Instance:
Ensure Docker and Docker Compose are configured on the target EC2 instance.
Replace the hostname and username in the workflow (ec2-18-171-204-143.eu-west-2.compute.amazonaws.com and ec2-user) with your instance's values.
Workflow Steps

1. Build and Push Docker Image
Docker Setup: Initializes Docker Buildx for enhanced build features.
AWS Login: Logs in to AWS ECR using the configured IAM role.
Build and Push: Builds the Docker image and pushes it to the specified ECR repository with a dynamic tag based on the GitHub workflow run details.
2. File Transfer
Archive Creation: Packages deployment files (docker-compose.yaml) into a .tar.gz archive.
SCP Transfer: Sends the archive to the EC2 instance.
3. Deployment
Unpack Files: Extracts the transferred archive on the EC2 instance.
Docker Deployment:
Pulls the Docker image from ECR.
Deploys the container using docker-compose.
Environment Variables

The pipeline uses the following dynamically set variables:

REGISTRY: AWS ECR registry URL.
REPOSITORY: Docker repository name.
IMAGE_TAG: Unique tag for the Docker image.
AWS_DEFAULT_REGION: AWS region for deployment.
Customization

AWS Region: Update the aws-region and AWS_DEFAULT_REGION values to match your region.
EC2 Instance Details: Replace host and username values in the SCP and SSH actions.
Docker Repository: Adjust the repository path (docker/my-ecr-repo) as needed.
Troubleshooting

Pipeline Fails on AWS Login:
Verify the IAM role has permissions for ecr:* and sts:AssumeRole.
Deployment Issues on EC2:
Ensure Docker and Docker Compose are installed on the EC2 instance.
Verify the instance has internet access for ECR and Docker image pulls.
SSH Key Issues:
Confirm that the private key added to GitHub Secrets matches the EC2 instance's public key.
Conclusion

This workflow provides an automated, robust pipeline to build, push, and deploy Docker images. Customize it as needed to fit your specific infrastructure and deployment requirements.

Let me know if you'd like additional details or modifications!