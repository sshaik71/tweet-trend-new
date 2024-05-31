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

        stage('SonarQube analysis') {
            environment {
                scannerHome = tool 'my_sonar_scanner'; //tool name in jenkins soanrqube tool
                }
            steps{
                withSonarQubeEnv('My SonarQube Server') { // If you have configured more than one global server connection, you can specify its name in jenkins config servers
                    sh "${scannerHome}/bin/sonar-scanner"
                }
             }
        }
       
    }
} 
