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

                withCredentials([
                    string(credentialsId: 'azure-client-id', variable: 'ARM_CLIENT_ID'),
                    string(credentialsId: 'azure-client-secret', variable: 'ARM_CLIENT_SECRET'),
                    string(credentialsId: 'azure-tenant-id', variable: 'ARM_TENANT_ID'),
                    string(credentialsId: 'azure-subscription-id', variable: 'ARM_SUBSCRIPTION_ID')
                ]) {
                    sh '''
                        terraform plan \
                        -input=false \
                        -var="subscription_id=$ARM_SUBSCRIPTION_ID"
                    '''
                }
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