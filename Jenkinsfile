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
    }
}
