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
                sh "mvn clean install"
            }
        }
          stage('Test') {
            steps {
                sh "mvn test"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubPwd', variable: 'dockerhub')]) {
                        sh "docker login -u aditijha15 -p ${dockerhub}"
                    } 
                    sh "docker build -t aditijha15/employee-management ."                    
                }
            }
        }
        stage('Push Image to DockerHub') {
            steps {
                script {
                   withCredentials([string(credentialsId: 'dockerhubPwd', variable: 'dockerhub')]) {
                        sh "docker login -u aditijha15 -p ${dockerhub}"
                    } 
                    sh "docker push aditijha15/employee-management"                  
                }
            }
        }
        stage('Docker Deployment') {
            steps {
                script {
                    sh "docker run -p 7777:7777 aditijha15/employee-management"
                }            
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                   withSonarQubeEnv(credentialsId: 'Sonar-API') {
                        sh "mvn clean package sonar:sonar"
                    }
                }
            }
        }        
    }
}
