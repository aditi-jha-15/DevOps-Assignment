pipeline {
    agent any
    tools{
        maven 'MAVEN'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/naima-rashid/DevOps-Assignment.git'
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
                    withSonarQubeEnv(credentialsId: 'SonarAPI') {
                        bat "mvn clean package sonar:sonar"
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
<<<<<<< HEAD
                    bat "docker build -t naimarashid/employee-management ."                    
=======

                    bat "docker build -t aditijha15/employee-management ."                    

>>>>>>> 82d819a2e9402c1b77add85627bf13af79c8b9b5
                }
            }
        }
        stage('Push Image to DockerHub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'DockerHubPwd', variable: 'dockerhubpwd')]) {
<<<<<<< HEAD
                        bat "docker login -u naimarashid -p ${dockerhubpwd}"
                    } 
                    bat "docker push naimarashid/employee-management"                  
=======

                        bat "docker login -u aditijha15 -p ${dockerhubpwd}"

                    }

                    bat "docker aditijha15/employee-management"                  

>>>>>>> 82d819a2e9402c1b77add85627bf13af79c8b9b5
                }
            }
        }
    }
}

