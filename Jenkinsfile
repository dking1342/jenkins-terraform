pipeline {
  agent any
  stages {
    stage('Terraform Init') {
      steps {
        sh '''
          cd terraform && rm -fr .terraform && rm -fr .terraform.lock.hcl && terraform init
        '''
      }
    }
  }
}