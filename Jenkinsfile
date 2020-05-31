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
    }
}
