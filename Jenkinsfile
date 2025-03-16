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
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deployment step - Add your deployment commands here'
            }
        }
    }
}
