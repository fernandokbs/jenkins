pipeline {
    // Definimos en donde queremos ejectuar este pipeline [any, none, label]
    agent any

    environment {
        SONAR_TOKEN = credentials('Tutorial-jenkins')
    }

    stages {
        stage('Verficar tools') {
            steps {
                sh 'docker info'
            }
        }

        stage('Build docker') {
            steps {
                sh 'docker build -t app-jenkins .'
            }
        }

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
                    // Ejecutamos el scanner de sonarqube, esta debe estar en la misma red que el contenedor de sonarqube y jenkins
                    docker.image('sonarsource/sonar-scanner-cli:latest').inside('--network ci-network') {
                        sh '''
                            sonar-scanner \
                                -Dsonar.host.url=http://sonarqube:9000 \
                                -Dsonar.projectKey=jenkins-php \
                                -Dsonar.src=src \
                                -Dsonar.token=$SONAR_TOKEN
                        '''
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

        success {
            // Enviamos mensaje al canal #tutorial cuando el build ya terminado sin problemas
            slackSend(channel: "#tutorial", message: "SUCCESS! test")
        }

        failure {
            slackSend(channel: "#tutorial", message: "SUCCESS! test")
        }
    }
}