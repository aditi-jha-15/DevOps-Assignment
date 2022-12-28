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

        stage('SonarQube Analysis') {

            steps {

                script {

                    withSonarQubeEnv(credentialsId: 'sonarAPIkey') {

                        sh "mvn clean package sonar:sonar"

                    }

                }

            }

        }
           stage('Build Docker Image') {

            steps {

                script{
                    sh "docker build -t devOps/employee-management ."
                }

            }

        }

    }

}
