pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        sh '''cd Almacen
ls
mvn -B -DskipTests clean package'''
      }
    }

  }
}