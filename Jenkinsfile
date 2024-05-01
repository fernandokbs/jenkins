pipeline {
    // Definimos en donde queremos ejectuar este pipeline [any, none, label]
    agent any

    stages {
        stage('Verficar tools') {
            steps {
                sh 'docker info'
            }
        }

        // stage('Build docker') {
        //     steps {
        //         sh 'docker build -t app-jenkins .'
        //     }
        // }

        stage('Run docker') {
            steps {
                sh 'docker run -dit --name app-jenkins app-jenkins'
            }
        }

        stage('Run specs') {
            steps {
                sh 'docker exec app-jenkins ./vendor/bin/phpunit tests'
            }
        }

        stage('Sonarqube') {
            steps {
                script {
                    docker.image('sonarsource/sonar-scanner-cli:latest').inside('--network ci-network') {
                        sh 'sonar-scanner'
                    }
                }
            }
        }
    }

    post {
        // Nos permite ejecutar acciones al finalizar el stages. disponibles always, success, failure
        always {
            sh 'docker stop app-jenkins'
            sh 'docker rm app-jenkins'
        }

        // success {
        //     // Enviamos mensaje al canal #tutorial cuando el build ya terminado sin problemas
        //     slackSend(channel: "#tutorial", message: "SUCCESS! test")
        // }

        // failure {
        //     slackSend(channel: "#tutorial", message: "SUCCESS! test")
        // }
    }
}