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
                    bat "docker build -t naimarashid/employee-management ."                    
                }
            }
        }
        stage('Push Image to DockerHub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'DockerHubPwd', variable: 'dockerhubpwd')]) {
                        bat "docker login -u naimarashid -p ${dockerhubpwd}"
                    } 
                    bat "docker push naimarashid/employee-management"                  
                }
            }
        }
    }
}

