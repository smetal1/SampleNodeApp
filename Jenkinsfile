pipeline {
  agent any
  stages {
    stage('Test') {
       steps{
        sh 'sonar-scanner -Dsonar.projectKey=demo-node -Dsonar.sources=. -Dsonar.host.url=http://sonar.getlend.in -Dsonar.login=9c4d2ffcb6fb6f8f57d485c3b698ba1375d736eb'
       }
    }
    stage('Docker Build Image') {
      steps {
          sh "docker build -t $DOCKER_CREDS_USR/testnodeapp:${env.BUILD_ID} -t saurav7055/testnodeapp:latest ."

      }
    }
    stage('Docker Push') {
      steps {
          sh "docker login -u $DOCKER_CREDS_USR -p $DOCKER_CREDS_PSW"
          sh "docker push $DOCKER_CREDS_USR/testnodeapp:${env.BUILD_ID}"
          sh "docker push $DOCKER_CREDS_USR/testnodeapp:latest"
        }
      }
  }
}