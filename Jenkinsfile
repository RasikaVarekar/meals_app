pipeline {
    agent any

    environment {
        FLUTTER_HOME = "/jenkins-agent/flutter"
        JAVA_HOME = "/home/rasika-varekar/jdk-17.0.12_linux-x64_bin/jdk-17.0.12"
        ANDROID_SDK_ROOT = "/jenkins-agent/android-sdk"
        PATH = "${FLUTTER_HOME}/bin:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${env.PATH}"
        MY_ENV_VAR = "Custom Value for Flutter Build"
    }

    options {
        timeout(time: 20, unit: 'MINUTES')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    def gitRepoUrl = 'https://github.com/RasikaVarekar/meals_app.git'
                    checkout([$class: 'GitSCM', 
                        branches: [[name: '*/main']],
                        userRemoteConfigs: [[url: gitRepoUrl]],
                        extensions: [[$class: 'CleanBeforeCheckout']]
                    ])
                }
            }
        }

        stage('Flutter Clean') {
            steps {
                sh '''
                echo "🧹 Running flutter clean..."
                flutter clean || { echo "❌ Flutter clean failed!"; exit 1; }
                '''
            }
        }

        stage('Flutter Pub Get') {
            steps {
                sh '''
                echo "📦 Fetching dependencies..."
                flutter pub get || { echo "❌ flutter pub get failed!"; exit 1; }
                '''
            }
        }

        stage('Analyze Code') {
            steps {
                sh '''
                echo "🔍 Analyzing code..."
                flutter analyze || echo "⚠️ Code analysis returned warnings but continuing..."
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                echo "🧪 Running tests..."
                flutter test || { echo "❌ Tests failed!"; exit 1; }
                '''
            }
        }

        // Uncomment this section if needed
        // stage('Build APK') {
        //     steps {
        //         sh '''
        //         echo "📱 Building APK (debug mode)..."
        //         flutter build apk --debug || { echo "❌ APK build failed!"; exit 1; }
        //         '''
        //     }
        // }

        // Optional APK output validation
        // stage('Check APK Output') {
        //     steps {
        //         sh '''
        //         echo "📂 Checking APK output directory..."
        //         ls -lah build/app/outputs/flutter-apk/ || { echo "❌ APK output not found!"; exit 1; }
        //         '''
        //     }
        // }
    }

    post {
        success {
            echo '✅ Flutter build pipeline completed successfully!'
        }
        failure {
            echo '❌ Flutter build pipeline failed!'
        }
    }
}
