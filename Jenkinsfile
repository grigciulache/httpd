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
                        app = docker.build("grigciulache/httpd")
                }
            }
        }
        stage('Push image'){
            steps{
                    echo 'Push image on docker hub'
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                                        app.push("${env.BUILD_NUMBER}")
                    } 
            }   
        }
        stage('Run Application'){
            steps{
                    echo 'Run Application'
            }   
        }
    }
}
