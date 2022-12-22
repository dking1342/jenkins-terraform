pipeline {
  agent any
  stages {
    stage('Export DO') {
      steps {
        sh '''
          echo "${DO_PAT}"
          echo ${DO_PAT}
          cat ~/.ssh/do_key_01
          cat ~/.ssh/do_key_01.pub
        '''
      }
    }

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

    stage('Terraform Validate') {
      steps {
        sh 'terraform validate -no-color'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh '''
          cd terraform 
          terraform plan -var 'do_token="${DO_PAT}"' -var "pvt_key=~/.ssh/do_key_01" -var "pub_key=~/.ssh/do_key_01.pub"
        '''
      }
    }
  }
}