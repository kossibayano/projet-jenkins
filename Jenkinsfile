pipeline {
    agent any

    environment {
        TOMCAT_IP = '192.168.1.11'
        TOMCAT_USER = 'root'
        TOMCAT_DIR = '/opt/tomcat/webapps'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Récupération du code source depuis GitHub...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Compilation du projet avec Maven...'
                sh 'mvn clean package'
            }
        }

        stage('Deploy distant') {
            steps {
                echo "Déploiement du WAR vers la machine distante ${TOMCAT_IP}..."
                sh "scp -o StrictHostKeyChecking=no target/*.war ${TOMCAT_USER}@${TOMCAT_IP}:${TOMCAT_DIR}/app.war"
            }
        }
    }

    post {
        success {
            echo "Déploiement réussi ! Application accessible sur http://${TOMCAT_IP}:8080/app/"
        }
        failure {
            echo 'Échec du pipeline.'
        }
    }
}
