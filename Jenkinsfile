pipeline {
    agent any

    stages {
        stage('clone code') {
            steps {
                git branch: 'main', url: 'https://github.com/sshaik71/tweet-trend-new.git'
            }
        }
    }
}
