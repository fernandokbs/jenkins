pipeline {
    agent Ubuntu-agente
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

        stage('Deploy') {
            steps {
                sshagent (credentials: ['1418774c-6a1f-4c63-ab86-56c1c7032d1f']) {
                    sh './deploy.sh'
                }
            }
        }
    }

    post {
        always {
            sh 'docker stop app-test-jenkins'
        }
    }
}