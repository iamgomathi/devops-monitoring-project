pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "📦 Checking out source code..."
                git 'https://github.com/iamgomathi/devops-monitoring-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image..."
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                echo "🚀 Running Terraform..."
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Ansible Setup') {
            steps {
                echo "⚙️ Running Ansible..."
                dir('ansible') {
                    sh 'ansible-playbook setup.yml'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
