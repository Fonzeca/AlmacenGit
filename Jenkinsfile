pipeline {
  agent any
  stages {
    stage('version') {
      steps {
        sh '''java -version
maven --version
mvn -version'''
      }
    }

  }
}