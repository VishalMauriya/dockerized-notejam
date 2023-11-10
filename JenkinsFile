pipeline {
    agent any

    stages {
        stage('Code') {
            steps {
                echo 'Cloning the code'
                git url: "https://github.com/VishalMauriya/dockerized-notejam.git",
                branch: "main"
            }
        }
        stage('Build') {
            steps {
                echo 'Building the code'
                sh "docker build -t notejam ."
            }
        }
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing image to docker hub'
                withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]){
                    sh "docker tag notejam ${env.dockerHubUser}/notejam"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker push ${env.dockerHubUser}/notejam"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying'
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
