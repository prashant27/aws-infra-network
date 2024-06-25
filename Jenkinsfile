pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Checkout start'
                git branch: env.BRANCH_NAME, url: 'https://github.com/prashant27/aws-infra-network.git'
                echo 'Checkout finish'
            }
        }
        stage('Install Terraform') {
            steps {                
                echo 'install terraform'
                
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
                echo 'terraform init'
                // sh 'terraform init'
            }
        }

        stage('Terraform Workspace') {
            steps {
                echo 'Terraform Workspace'
                // script {
                //     handleWorkspace()
                // }
            }
        }

        stage('Terraform Validate') {
            steps {
                echo 'terraform validate'
                // sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Terraform Plan'
                // sh 'terraform plan -out=tfplan'
            }
        }       

        stage('Checkov Scan') {
            steps {
                echo 'checkov -d .'
                // sh 'checkov -d .'
            }
        }
        stage('Terraform Apply') {
            // when {
            //     branch 'main'
            // }
            steps {
              echo 'Terraform Apply'
              // sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Clean Up') {
            steps {
                echo 'Clean Up'
                // sh 'rm -rf terraform.zip tfplan'
            }
        }
    }
}

def installTerraform(version) {
    sh """
        # Download Terraform
        curl -o terraform.zip https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip

        # Unzip Terraform
        unzip terraform.zip

        # Move Terraform binary to /usr/local/bin
        sudo mv terraform /usr/local/bin/

        # Verify Terraform installation
        terraform --version
    """
}

def installCheckov(version) {
    sh """
        # Install Checkov
        pip install checkov==${version}

        # Verify Checkov installation
        checkov --version
    """
}

def handleWorkspace() {
    def workspaceName = env.BRANCH_NAME.replaceAll('/', '-')
    def workspaceExists = sh(script: "terraform workspace list | grep -w ${workspaceName}", returnStatus: true) == 0
    if (workspaceExists) {
        sh "terraform workspace select ${workspaceName}"
    } else {
        sh "terraform workspace new ${workspaceName}"
    }
}
