pipeline {
 agent any
    tools{

        maven 'MAVEN'

    }



    stages {

        stage('Git Checkout') {

            steps {

                git branch: 'main', url: 'https://github.com/aditi-jha-15/DevOps-Assignment.git'

            }

        }

        stage('Build') {

            steps {

                bat "mvn clean install"

            }

        }

          stage('Test') {

            steps {

                bat "mvn test"

            }

        }

      
        stage('Build Docker Image') {

            steps {

                script {
                    script {

                        withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerHubPwd')]) {

                        bat "docker login -u aditijha15 -p ${dockerHubPwd}"

                    }

                    bat "docker build -t aditijha15/devops-assignment ."                    

                }

            }

        }
        }    

        stage('Push Image to DockerHub') {

            steps {

                script {

                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerHubPwd')]) {

                        bat "docker login -u aditijha15 -p ${dockerHubPwd}"

                    }

                    bat "docker push aditijha15/devops-assignment"                  

                }

            }

        }

    }

}
