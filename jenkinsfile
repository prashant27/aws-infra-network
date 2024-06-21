pipeline {
    agent any

    // environment {
    //     // Define your environment variables here
    //     AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
    //     AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    //     TERRAFORM_VERSION = '1.0.0'
    // }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/prashant27/aws-infra-network.git'
            }
        }

        stage('Install Terraform') {
            steps {
                sh """
                    echo 'install terraform'
                """
                // sh """
                //     # Download Terraform
                //     curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

                //     # Unzip Terraform
                //     unzip terraform.zip

                //     # Move Terraform binary to /usr/local/bin
                //     sudo mv terraform /usr/local/bin/

                //     # Verify Terraform installation
                //     terraform --version
                // """
            }
        }

        stage('Terraform Init') {
            steps {
                // sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                // sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                // sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            when {
                branch 'main'
            }
            steps {
                // sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Clean Up') {
            steps {
                // sh 'rm -rf terraform.zip tfplan'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}