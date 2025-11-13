pipeline {
    agent any

    environment {
        TF_WORKING_DIR = "terraform"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access-key']]) {
                    dir("${env.TF_WORKING_DIR}") {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Ansible Configuration') {
            steps {
                dir("${env.TF_WORKING_DIR}/ansible") {
                    sh 'ansible-playbook setup.yml'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}
