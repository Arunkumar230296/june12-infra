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

        stage('Terraform Backend Init') {
            steps {
                dir("${TF_BACKEND_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Backend Validate') {
            steps {
                dir("${TF_BACKEND_DIR}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Backend Plan') {
            steps {
                dir("${TF_BACKEND_DIR}") {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Backend Apply') {
            steps {
                input message: 'Approve backend creation?'
                dir("${TF_BACKEND_DIR}") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
