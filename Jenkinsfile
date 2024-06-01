def registry = 'https://rahaman.jfrog.io/'

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
        stage("Builds") {
             steps {
                echo "----------------Build Started----------------"
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                echo "----------------Build Finished----------------"
             }
        }
        stage('Unit tests'){
            steps {
                echo "----------------Unit tests Started----------------"
                sh 'mvn surefire-report:report'
                echo "----------------Unit tests Finished----------------"
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
       
       stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        
        stage("Jar Publish") {
            steps {
                script {
                    echo '<--------------- Jar Publish Started --------------->'
                     def server = Artifactory.newServer url:registry+"/artifactory" ,  credentialsId:"artifactory_token"
                     def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}";
                     def uploadSpec = """{
                          "files": [
                            {
                              "pattern": "jarstaging/(*)",
                              "target": libs-release-local/{1},
                              "flat": "false",
                              "props" : "${properties}",
                              "exclusions": [ "*.sha1", "*.md5"]
                            }
                         ]
                     }"""
                     def buildInfo = server.upload(uploadSpec)
                     buildInfo.env.collect()
                     server.publishBuildInfo(buildInfo)
                     echo '<--------------- Jar Publish Ended --------------->'  
            
                }
            }   
        }   


    }    
} 
