pipeline {
  agent any
  stages {
    stage('Terraform Format') {
      steps {
        sh 'cd terraform && terraform fmt -check'
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'cd terraform && rm -fr .terraform && rm -fr .terraform.lock.hcl && terraform init'
      }
    }
  }
}