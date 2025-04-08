pipeline {
    agent any

    environment {
        PATH = "/home/jenkins/flutter/bin:$PATH"
    }

    stages {
        stage('Flutter Clean') {
            steps {
                sh 'flutter clean'
            }
        }

        stage('Flutter Pub Get') {
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
        success {
            echo '✅ Build succeeded!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}
