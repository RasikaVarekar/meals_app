pipeline {
    agent any

    environment {
        PATH = "/jenkins-agent/flutter/bin:$PATH"
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
        script {
            sh 'flutter analyze || true'
        }
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
