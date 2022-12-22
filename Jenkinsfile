pipeline {
  agent any
  stages {
    stage('Log') {
      steps {
        sh 'ls -la',
        sh 'pwd'
      }
    }

    stage('Hello World') {
      steps {
        sh 'echo "Hello World!"'
      }
    }

  }
}