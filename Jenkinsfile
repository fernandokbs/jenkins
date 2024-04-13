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
                sh 'docker-compose up -d'
            }
        }

        stage('Instalar dependencias') {
            steps {
                sh 'docker-compose exec app composer install --no-cache'
            }
        }

        stage('Run test') {
            steps {
                sh 'docker-compose exec app php artisan test'
            }
        }
    }
}