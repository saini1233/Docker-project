pipeline {
    agent any
    
    // Define variables for the image, container names, and port number
    environment {
        IMAGE_NAME = 'myapp1234:latest'
        CONTAINER_NAME = 'promo5'
        PORT_NO = '8015' // Define the port number variable
        REPO_URL = '' // Replace with your repo URL
        BRANCH_NAME = 'main' // Specify the branch name here
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                script {
                    // Checkout the specified branch from the Git repository
                    git branch: "${BRANCH_NAME}", url: "${REPO_URL}"
                }
            }
        }
        
        stage('Build') {
            steps {
                script {
                    // Build the Docker image using the current directory (where the Jenkinsfile is located)
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    // Run a container to test if index.html exists
                    sh "docker run --rm ${IMAGE_NAME} cat /var/www/html/index.html"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // Run the container and start Apache
                    sh "docker run -itd -p ${PORT_NO}:80 --name ${CONTAINER_NAME} ${IMAGE_NAME} /bin/bash"
                    sh "docker exec ${CONTAINER_NAME} systemctl start apache2"
                    sh "docker exec ${CONTAINER_NAME} systemctl enable apache2"
                }
            }
        }
    }
}
