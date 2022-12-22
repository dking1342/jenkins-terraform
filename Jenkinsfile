pipeline {
  agent any
  stages {
    stage('Update') {
      steps {
        sh '''
          terraform --version
        '''
      }
    }
  }
}