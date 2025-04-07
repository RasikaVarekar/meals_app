pipeline {
    agent any

    environment {
        PATH = "${PATH}:"/jenkins-agent/flutter/bin"
    }

    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/RasikaVarekar/meals_app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }

        stage('Analyze Code') {
            steps {
                sh 'flutter analyze'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'flutter test'
            }
        }

        stage('Build APK') {
            steps {
                sh 'flutter build apk --debug'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
        success {
            echo 'Build and test successful!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
