pipeline {
    agent any
    tools{
        maven 'MAVEN'
    }

    stages {
        stage('git') {
            steps {
                git branch: 'main', url: 'https://github.com/aditi-jha-15/DevOps-Assignment.git'
            }
        }
        stage('build') {
            steps {
                sh "mvn clean install"
            }
        }
          stage('test') {
            steps {
                sh "mvn test"
            }
        }
        stage('sonarqube analysis'){
            steps {
                withSonarQubeEnv(credentialsId: 'sonarAPIkey') {
                   sh "mvn clean package sonar:sonar"
}
 }
}
