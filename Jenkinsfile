pipeline {
  agent any
  stages {
    stage('Update') {
      steps {
        sh '''
          whoami
          sudo -v
          sudo -l
        '''
      }
    }
  }
}