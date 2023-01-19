/* Requires the Docker Pipeline plugin */
pipeline {
    agent {
        label 'main'
    }

    stages {
        stage('Hello') {
            steps {
                echo "Let's start!"
            }
        }

        stage('Checkout') {
            steps {
                ws('/tmp/git/diplom') {
                    tool name: 'Default', type: 'git'
                    git branch: 'main', credentialsId: 'github_jan-z-turawa', url: 'https://github.com/Jan-z-Turawa/Prepare.git'
                }
            }
        }        
        
        stage('Build') {
            steps {
                dir('/tmp/git/diplom') {
                    sh 'docker build -t my-php-app .'
                }
            }
        }        
        
        stage('Apply') {
            when {
                branch 'main'
            } 
            steps {
                dir('/tmp/git/diplom/docker_compose') {
                    sh 'docker-compose up -d'
                }
            }
        }        
        
        stage('Bye') {
            steps {
                echo 'Job is done!'
            }
        }
    }
}
