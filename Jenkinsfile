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
                echo 'Building docker image'
            }
        }

        stage('Build docker') {
            steps {
                sh 'docker build -t app-test-jenkins .'
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