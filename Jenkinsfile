pipeline {
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
    }
}