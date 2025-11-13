
stage('Terraform Init & Apply') {
    steps {
        dir('terraform') {   // 👈 go inside the terraform folder
            withCredentials([[
                $class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'aws-access-key'
            ]]) {
                sh '''
                    terraform init
                    terraform apply -auto-approve
                '''
            }
        }
    }
}
