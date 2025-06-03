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
                sh '''cmake --build ${BUILD_DIR} -- -j$(nproc)'''
            }
        }

        stage('Test') {
            steps {
                sh "cd ${BUILD_DIR} && ctest --output-on-failure --gtest_output=xml:test_results.xml"
                junit "${BUILD_DIR}/test_results.xml"
            }
        }
    }

    post {
        success {
            echo 'Bu
