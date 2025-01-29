pipeline {
    agent any
    
    // Define variables for the image, container names, and port number
    environment {
        IMAGE_NAME = 'myapp12:latest'
        CONTAINER_NAME = 'promo3'
        PORT_NO = '8014' // Define the port number variable
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} /docker2/"
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh "docker run ${IMAGE_NAME} cat /var/www/html/index.html"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh "docker run -itd -p ${PORT_NO}:80 --name ${CONTAINER_NAME} ${IMAGE_NAME} /bin/bash"
                    sh "docker exec ${CONTAINER_NAME} systemctl start apache2"
                    sh "docker exec ${CONTAINER_NAME} systemctl enable apache2"
                }
            }
        }
    }
}
