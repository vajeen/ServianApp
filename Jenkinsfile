pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    retry(5) {
						sh 'chmod +x build.sh'
                        sh './build.sh'
                    }
                }
            }
        }
		stage('Deploy') {
            steps {
                timeout(time: 3, unit: 'MINUTES') {
                    retry(5) {
						sh "ssh -t app1 mkdir -p /home/jenkins/web"
						sh 'scp dist/*  app1:/home/jenkins/web/'
						sh "ssh app1 'bash -s' < start.sh"
                    }
                }
            }
        }
    }
}