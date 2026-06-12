pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_BACKEND_DIR = 'terraform/backend'
        TF_DEV_DIR = 'terraform/environments/dev'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('DEV Terraform Init') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_DEV_DIR}") {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('DEV Terraform Validate') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_DEV_DIR}") {
                        sh 'terraform validate'
                    }
                }
            }
        }

        stage('DEV Terraform Plan') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_DEV_DIR}") {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('DEV Terraform Apply') {
            steps {
                input message: 'Approve DEV infra creation?'
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_DEV_DIR}") {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
