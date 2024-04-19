pipeline {
    agent any

    stages {
        stage('Verficar tools') {
            steps {
                sh 'docker info'
            }
        }

        stage('Run docker image') {
            steps {
                sh 'docker run -dit --name app-test-jenkins app-test-jenkins'
            }
        }

        stage('Run specs') {
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
    }
}