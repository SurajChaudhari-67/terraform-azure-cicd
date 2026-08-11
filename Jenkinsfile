pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out Terraform code...'
            }
        }

        stage('Terraform Init') {
            steps {
                echo 'Initializing Terraform...'
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                echo 'Validating Terraform configuration...'
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Creating Terraform plan...'
                sh 'terraform plan -input=false'
            }
        }
    }

    post {
        success {
            echo 'Terraform CI Pipeline completed successfully!'
        }

        failure {
            echo 'Terraform CI Pipeline failed!'
        }
    }
}