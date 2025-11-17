pipeline {
    agent { label 'master' }

    environment {
        IMAGE_NAME = "java_hello_student"
        CONTAINER_NAME = "java_hello_student_container"
        APP_PORT = "8081"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/prakruti95/java_hello_student.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn -B clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Run Container') {
            steps {
                sh """
                    if [ \$(docker ps -a -q -f name=${CONTAINER_NAME}) ]; then
                        docker rm -f ${CONTAINER_NAME} || true
                    fi
                    docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:8081 ${IMAGE_NAME}:latest
                """
            }
        }
    }

    post {
        always {
            sh 'docker images || true'
        }
    }
}
