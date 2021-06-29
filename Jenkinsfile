pipeline {
  agent any
  stages {
    stage('version') {
      steps {
        sh '''java -version
mvn -version'''
        sh '''cd Almacen
mvn -B -DskipTests clean package'''
      }
    }

  }
}