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

    stage('Deploy with Docker Compose') {
        steps {
            echo 'Desplegando contenedor con Docker Compose...'
            sh '''
            docker-compose down || true  # Apaga cualquier instancia previa
            docker-compose up -d        # Levanta la infraestructura definida
            '''
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
