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
        
        stage('Run Application'){
            steps{
                    echo 'Run Application'      
                     powershell label: '', script: '''$ErrorActionPreference =      \'SilentlyContinue\'
                     docker-compose up -d
                     '''    
            }
        }
    }
}
