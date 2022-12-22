pipeline {
  agent any
  stages {
    stage('SSH Setup') {
      steps {
        sh '''
          mkdir -p ~/.ssh
          chmod 777 ~/.ssh
          touch ~/.ssh/do_key_01
          touch ~/.ssh/do_key_01.pub
          chmod 777 ~/.ssh/do_key_01
          chmod 777 ~/.ssh/do_key_01.pub
          ls -la
          ls -la ~/.ssh
        '''
      }
    }
  }
}