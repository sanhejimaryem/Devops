pipeline {
  agent any
  tools {
        maven "M2_HOME"
    }
  stages {
      stage("GIT CHECKOUT") {
            steps {
            
                echo 'Pulliing ...';
                git branch: 'maryem', url: 'https://github.com/sanhejimaryem/Devops.git'          
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
     stage("Publish to Nexus Repository Manager") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artifactPath = filesByGlob[0].path;
                    artifactExists = fileExists artifactPath;
                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                            nexusVersion: 'nexus3',
                            protocol: 'http',
                            nexusUrl: '192.168.1.48:8081',
                            groupId: 'pom.tn.esprit.rh',
                            version: 'pom.1.9',
                            repository: 'maven-central-repository',
                            credentialsId: 'nexus',
                            artifacts: [
                                [artifactId: 'pom.achat',
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],
                                [artifactId: 'pom.achat',
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );
                    } else {
                        error "*** File: ${artifactPath}, could not be founddd";
                    }
                }
            }
            
        }
    stage("Docker build"){
         steps {
         sh 'docker version'
         sh 'docker build -t esprit .'
         sh 'docker image list'
         sh 'docker tag esprit maryemsanheji/cicd:1.9'
        
        withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
            sh 'docker login -u maryemsanheji -p $PASSWORD'
        }
       }
  }
    stage("Push Image to Docker Hub"){
      steps {
       sh 'docker push  maryemsanheji/cicd:1.9'

    }
    }
}

}
