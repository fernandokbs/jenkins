pipeline {
    agent any
    stages {
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
}