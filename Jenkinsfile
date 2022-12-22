pipeline {
  agent any
  stages {
    stage('Log') {
      steps {
        sh 'echo "Log step"'
        sh '''
          echo "Multiline shell"
          ls -la
        '''
      }
    }

    stage('Hello World') {
      steps {
        sh 'echo "Hello World!"'
      }
    }

  }
}