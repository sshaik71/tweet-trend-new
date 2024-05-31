pipeline {
    agent {
        node{
            label 'maven-slave'
        }
    }

environment {
    PATH = "/opt/maven-3.9.7/bin:$PATH"
    JAVA_HOME = "/usr/bin/java"
}

    stages {
        stage ("Buils"){
             steps{
                sh 'mvn clean deploy'
             }
        }
       
    }
} 
