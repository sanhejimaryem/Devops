pipeline {
  agent any
  tools {
        maven "M2_HOME"
    }
  stages {
      stage("GIT CHECKOUT") {
            steps {
                script {
                    git 'https://github.com/sanhejimaryem/Devops.git'
                }
            }
        }
    stage('MVN COMPILE') {
      steps {
        sh 'mvn compile'
      }
    }
      //  stage('MVN TEST') {
       //     steps {
        //        sh 'mvn test'
        //    }
       // }
       stage("Maven BUILD") {
            steps {
                script {
                    sh "mvn install -DskipTests=true"
                }
            }
        }
        
        stage ('Maven Test Sonar') {
            steps {
//                sh 'cd achat'
                sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:RELEASE:sonar -Dsonar.login=admin -Dsonar.password=13265894'
            }
}
}

}
