pipeline {
 agent {
    label 'docker' 
  }
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

        stage('SonarQube Analysis') {

            steps {

                script {

                    withSonarQubeEnv(credentialsId: 'Sonar-API') {

                        bat "mvn clean package sonar:sonar"

                    }

                }

            }

        }

        stage('Build Docker Image') {

            steps {

                script {

                    bat "docker build -t aditijha15/employee-management ."                    

                }

            }

        }

        // stage('Push Image to DockerHub') {

        //     steps {

        //         script {

        //             withCredentials([string(credentialsId: 'DockerHubPwd', variable: 'dockerhubpwd')]) {

        //                 bat "docker login -u naimarashid -p ${dockerhubpwd}"

        //             }

        //             bat "docker push naimarashid/employee-management"                  

        //         }

        //     }

        // }

    }

}
