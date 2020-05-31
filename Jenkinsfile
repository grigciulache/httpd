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
                    //powershell label: '', script: 'hello.ps1' -KO
                    powershell label: '', script: 'Write-Host \'Hello, World!\''
                    powershell label: '', script: hello.ps1
            }   
        }
    }
}
