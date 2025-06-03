pipeline {
    agent any

    environment {
        BUILD_DIR = 'build'
    }

    stages {
        stage('Clean') {
            steps {
                sh "rm -rf ${BUILD_DIR}"
            }
        }

        stage('Configure') {
            steps {
                sh "cmake -S . -B ${BUILD_DIR}"
            }
        }

        stage('Build') {
            steps {
                sh 'cmake --build ' + BUILD_DIR + ' -- -j$(nproc)'
            }
        }

        stage('Test') {
            steps {
                sh "cd ${BUILD_DIR} && ctest --output-on-failure --gtest_output=xml:test_results.xml"
                junit "${BUILD_DIR}/test_results.xml"
                ctest --output-on-failure
            }
        }
    }

    post {
        success {
            echo 'Build ve test başarılı.'
        }
        failure {
            echo 'Build ya da test HATALI! E-posta gönderiliyor...'
            emailext subject: "BUILD FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                     body: """Proje: ${env.JOB_NAME}
Build: #${env.BUILD_NUMBER}
Sonuç: HATALI
URL: ${env.BUILD_URL}""",
                     to: 'fatihsezen11@gmail.com'
        }
    }
}
