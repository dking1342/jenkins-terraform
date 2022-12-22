pipeline {
  agent any
  stages {
    stage('Testing stage') {
      steps {
        sh '''
          echo "testing stage"
          docker --version
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
          terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=~/.ssh/do_key_01" -var "pub_key=~/.ssh/do_key_01.pub"
        '''
      }
    }

    stage('Terraform Apply') {
      steps {
        sh '''
          cd terraform 
          terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=~/.ssh/do_key_01" -var "pub_key=~/.ssh/do_key_01.pub"
        '''
      }
    }

    stage('IP Address Search') {
      steps {
        sh '''
          curl --header "Authorization: Bearer ${TF_TOKEN}" --header "Content-Type: application/vnd.api+json" "https://app.terraform.io/api/v2/organizations/kavooce1/workspaces/" > ./ansible/ws.json 
          export TF_PROJECT=$(cat ./ansible/ws.json | jq '.data[0].id' | sed 's/\"//g')
          curl --header "Authorization: Bearer ${TF_TOKEN}" --header "Content-Type: application/vnd.api+json" "https://app.terraform.io/api/v2/workspaces/$TF_PROJECT/current-state-version?include=outputs" > ./ansible/outputs.json
          if test -f "./ansible/hosts.ini"; then
            rm ./ansible/hosts.ini
          fi && \
          echo "[droplets]" > ./ansible/hosts.ini
          curl --header "Authorization: Bearer ${TF_TOKEN}" --header "Content-Type: application/vnd.api+json" "https://app.terraform.io/api/v2/workspaces/$TF_PROJECT/current-state-version?include=outputs" | grep -Eo "[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}" >> ./ansible/hosts.ini
        '''
      }
    }

    // stage('Sleep') {
    //   steps {
    //     sh '''
    //       sleep 10
    //     '''
    //   }
    // }

    // stage('Ansible Playbook') {
    //   steps {
    //     sh '''
    //       ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -e "pub_key=~/.ssh/do_key_01.pub" ./ansible/application-install.yaml
    //     '''
    //   }
    // }
  }
}