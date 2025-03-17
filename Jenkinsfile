pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials' // Use the credentials ID you created in Jenkins
        DOCKER_IMAGE_NAME = 'nadiaakter2480/mavenwebapp' // Your Docker Hub repository name
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/NadiaAkter24/MavenWebApp.git'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    withDockerRegistry([credentialsId: "${DOCKER_CREDENTIALS_ID}", url: "https://index.docker.io/v1/"]) {
                        echo "Logged in to Docker Hub"
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    bat "docker push ${DOCKER_IMAGE_NAME}:latest"
                }
            }
        }
    }
}
