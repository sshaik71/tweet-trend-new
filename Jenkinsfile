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
        stage ("Builds") {
             steps {
                echo "----------------Build Started----------------"
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                echo "----------------Build Finished----------------"
             }
        }
       
    }
} 
