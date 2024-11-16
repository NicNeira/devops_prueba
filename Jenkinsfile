pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'helloworld-app' // Nombre de la imagen Docker
  }

  stages {
    stage('Build') {
      steps {
        echo 'Compilando el proyecto con Maven...'
        sh 'mvn clean package'
      }
    }

    stage('Test') {
      steps {
        echo 'Ejecutando pruebas unitarias con Maven...'
        sh 'mvn test'
      }
    }

    stage('Docker Build') {
      steps {
        echo 'Construyendo la imagen Docker...'
        sh "docker build -t ${DOCKER_IMAGE} ."
      }
    }

    stage('Docker Run') {
      steps {
        echo 'Desplegando el contenedor Docker...'
        sh """
          docker stop ${DOCKER_IMAGE} || true
          docker rm ${DOCKER_IMAGE} || true
          docker run -d -p 8080:8080 --name ${DOCKER_IMAGE} ${DOCKER_IMAGE}
        """
      }
    }
  }

  post {
    success {
      echo 'Pipeline completado con éxito.'
    }
    failure {
      echo 'El pipeline ha fallado. Revisa los logs para más detalles.'
    }
  }
}
