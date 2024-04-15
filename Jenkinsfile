pipeline {
    agent any
    stages {
        stage('Initialization') {
            steps {
                echo "Build URL: ${env.BUILD_URL}"
                echo "Build Number: ${env.BUILD_NUMBER}"
                echo "Job Name: ${env.JOB_NAME}"
                echo "Jenkins URL: ${env.JENKINS_URL}"
                script {
                    def buildUser = env.BUILD_USER_ID ?: 'unknown'
                    echo "Build triggered by: ${buildUser}"
                }
            }
        }

        stage('Verificar tools') {
            steps {
                sh 'docker info'
            }
        }

        stage('Build docker') {
            steps {
                sh 'docker build -t app-test-jenkins .'
            }
        }

        stage('Start docker') {
            steps {
                sh 'docker run -dit --name app-test-jenkins app-test-jenkins'
            }
        }

        stage('Run test') {
            steps {
                sh 'docker exec app-test-jenkins ./vendor/bin/phpunit tests'
            }
        }
    }
    post {
        always {
            sh 'docker stop app-test-jenkins'
            sh 'docker rm app-test-jenkins'
        }

        success {
            slackSend(channel: '#robots', message: "SUCCESS: The build completed successfully.")
        }

        failure {
            slackSend(channel: '#robots', message: "FAILURE: The build failed. ")
        }
    }
}