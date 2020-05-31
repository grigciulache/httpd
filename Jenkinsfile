pipeline{

    environment {
    registry = "grigciulache/httpd"
    registryCredential = 'dockerhub'
  } 
    agent any
    stages{
        stage("Git clone"){
            steps{
                echo 'Git clone'
                git 'https://github.com/grigciulache/httpd.git'
            }
        }
        stage("Build image"){
            steps{
                echo 'test biuld'
                script {
                            docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image on docker hub') {
            steps{
                script {
                        /*
                            docker.withRegistry( '', registryCredential ) {
                            dockerImage.push()
                        */
                            docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                                app.push("${env.BUILD_NUMBER}")
                                app.push("latest")
                            } 
                }
            }
        }
    }
        stage("Run application"){
            steps{
                echo 'test run'
            }
        }
    }
}