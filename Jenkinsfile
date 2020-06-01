pipeline{

    environment {
        registry = "grigciulache/httpd"
        registryCredential = 'dockerhub'
        projectGit='https://github.com/grigciulache/httpd.git'
    } 
    agent any
    stages{
        stage("Git clone"){
            steps{
                echo 'Git clone'
                git projectGit
            }
        }
        stage("Build image"){
            steps{
                echo 'test bild'
                script {
                        //app = docker.build("grigciulache/httpd")
                        app = docker.build(registry)
                }
            }
        }
        stage('Push image'){
            steps{
                    echo 'Push image on docker hub'
                    script{
                        docker.withRegistry('', registryCredential) {
                            app.push("${env.BUILD_NUMBER}")
                            app.push("latest")
                        } 
                    }
            }   
        }
        stage('Run Application'){
            steps{
                    echo 'Run Application'
                    powershell label: '', script: '''$ErrorActionPreference = \'SilentlyContinue\'
                    docker build -t apache .
                    docker stop apache
                    docker rm apache
                    docker run -d -p 8089:80 --name apache apache'''
        }
    }
}
