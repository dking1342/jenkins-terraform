pipeline {
  agent any
  stages {
    stage('Update') {
      steps {
        sh '''
          java --version
          sudo apt update
        '''
      }
    }
  }
}