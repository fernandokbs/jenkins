pipeline {
    agent any
    stages {
        stage('Verificar tools') {
            steps {
                sh 'docker info'
            }
        }

        stage('Verificar 222') {
            steps {
                echo 'hola'
            }
        }

        stage('Run container') {
            steps {
                sh 'docker run -dit --name app-test-jenkins app-test-jenkins' 
            }
        }

        stage('Test container') {
            steps {
                sh 'docker exec app-test-jenkins ./vendor/bin/phpunit tests'
            }
        }
    }
}