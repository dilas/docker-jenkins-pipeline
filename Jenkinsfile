node {
  checkout scm

  env.PATH = "${tool 'Maven3'}/bin:${env.PATH}"

  stage('Package') {
    sh 'mvn clean package'
  }

  stage('Create Docker Image') {
    docker.build("odilontalk/docker-jenkins-pipeline:${env.BUILD_NUMBER}")
  }

  stage ('Run Application') {
    try {

      // Run application using Docker image
      // sh "docker run odilontalk/docker-jenkins-pipeline:${env.BUILD_NUMBER}"

    } catch (error) {

    } finally {
      // Stop and remove database container here

    }
  }

  stage('Run Tests') {
    try {

      sh "mvn test"
      
      docker.build("odilontalk/docker-jenkins-pipeline:${env.BUILD_NUMBER}").push()

    } catch (error) {

    } finally {
      junit '**/target/surefire-reports/*.xml'
    }
  }
}