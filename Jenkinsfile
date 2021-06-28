pipeline {
  agent {
    docker {
      image 'maven:latest'
    }

  }
  stages {
    stage('Build') {
      agent any
      steps {
        sh '''ls
maven --version'''
      }
    }

  }
}