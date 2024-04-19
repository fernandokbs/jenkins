pipeline {
    agent { label 'agente1' }

    stages {
        stage('Verficar tools') {
            steps {
                sh 'docker info'
            }
        }
    }

    post {
        always {
            sh 'docker stop app-test-jenkins'
            sh 'docker rm app-test-jenkins'
        }

        success {
            slackSend(channel: "#tutorial", message: "SUCCESS! test")
        }
    }
}