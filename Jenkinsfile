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
        stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
            //app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
        }

    }
}
