pipeline{
    agent any
    stages{
        stage("git clone"){
            steps{
                echo 'test git'
            }
        }
        stage("build"){
            steps{
                echo 'test biuld'
            }
        }
        stage("push on docker hub"){
            steps{
                echo 'test push'
            }
        }
        stage("run application"){
            steps{
                echo 'test run'
            }
        }
    }
}