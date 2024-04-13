pipeline {
    agent any
    stages {
        stage('Verificar tools') {
            steps {
                sh 'docker info'
            }
        }

        stage('Start docker') {
            steps {
                sh 'docker build -t app-test-jenkins .'
            }
        }

        stage('Instalar dependencias') {
            steps {
                sh 'docker exec app-test-jenkins composer install --no-cache'
            }
        }

        stage('Run test') {
            steps {
                sh 'docker exec app-test-jenkins ./vendor/bin/phpunit tests'
            }
        }
    }
}