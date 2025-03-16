pipeline {
    agent any
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
                 bat 'mvn test'  // <-- FIXED for Windows
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deployment step - Add your deployment commands here'
            }
        }
    }
}
