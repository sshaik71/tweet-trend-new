pipeline {
    agent {
        node{
            label 'maven-slave'
        }
    }

environment {
    PATH = "/opt/maven-3.9.7/bin:$PATH"
}

    stages {
        stage ("Buils"){
             steps{
                sh 'mvn clean install'
             }
        }
       
    }
} 
