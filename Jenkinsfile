pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_BACKEND_DIR = 'terraform/backend'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Backend Init') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_BACKEND_DIR}") {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Backend Validate') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_BACKEND_DIR}") {
                        sh 'terraform validate'
                    }
                }
            }
        }

        stage('Terraform Backend Plan') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_BACKEND_DIR}") {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Backend Apply') {
            steps {
                input message: 'Approve Terraform backend creation?'
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir("${TF_BACKEND_DIR}") {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
