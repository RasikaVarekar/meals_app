pipeline {
    agent any

    environment {
        FLUTTER_HOME = "/jenkins-agent/flutter"
        PATH = "${env.PATH}:${FLUTTER_HOME}/bin"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/RasikaVarekar/meals_app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }
        stage('Setup Flutter') {
          steps {
                sh 'flutter doctor'
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
            echo '✅ Build and tests successful!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}
