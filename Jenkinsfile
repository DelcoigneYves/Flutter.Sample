pipeline {
    agent {
      node {
        label 'flutter&&daemon'
      }
    }

    stages {

        stage('Stop Old Build') {
            steps {
                milestone label: '', ordinal:  Integer.parseInt(env.BUILD_ID) - 1
                milestone label: '', ordinal:  Integer.parseInt(env.BUILD_ID)
            }
        }

        stage('Checkout') {
            steps {
                deleteDir()
                checkout scm
            }
        }

        /*stage('Dependencies') {
            steps {
                executeFastlane('restore')
            }
        }
  
        stage('Build') {
            steps {
                executeFastlane('build')
            }
        }*/

        stage('Tests') {
            steps {
                sh "chmod +x ./run_tests.sh"
                sh "./run_tests.sh"
                sh "bash <(curl -s https://codecov.io/bash) -t e841dae6-da5a-4326-bc1f-9e98c9efff8b"
            }
        }

        /*stage('Static analysis') {
            when {
                branch 'develop'
            }
            steps {
                executeFastlane('static_analysis')
            }
        }*/

        /*stage('Deploy') {
            when {
              not {
                branch 'PR-*';
              }
            }
            steps {
                executeFastlane('deploy')
            }
        }*/
    }

    post {
      always {
        // Cleanup
        deleteDir() 
      }
      success {
        echo 'Build Succeeded'
      }
      unstable {
        echo 'Build Unstable'
      }
      failure {
        echo 'Build Failed'
      }
    }
}