pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Set Up Python Environment') {
            steps {
                sh '''
                    python3 -m venv $VENV_DIR
                    source $VENV_DIR/bin/activate
                    pip install --upgrade pip
                    pip install robotframework
                '''
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                sh '''
                    source $VENV_DIR/bin/activate
                    robot -d results tests/
                '''
            }
        }

        stage('Publish Robot Framework Results') {
            steps {
                publishRobotResults outputPath: 'results/output.xml'
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML(target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: 'results',
                    reportFiles: 'report.html',
                    reportName: 'Robot Framework Report'
                ])
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**', fingerprint: true
        }
    }
}

