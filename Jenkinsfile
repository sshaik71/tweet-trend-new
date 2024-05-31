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
        steps{
            sh 'maven clean deploy'
        }
    }
} 
