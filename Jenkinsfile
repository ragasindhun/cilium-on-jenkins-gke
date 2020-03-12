pipeline {
   agent any	
   environment {
        PROJECT_ID = 'extreme-torch-268218'
        CLUSTER_NAME = 'cluster-for-cilium'
        LOCATION = 'us-central1-c'
        CREDENTIALS_ID = 'jenkins-deployer-credentials'
   }
   stages {
      stage("Install Kubectl on Jenkins") {
            steps {
                sh 'curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl'
		sh 'chmod +x ./kubectl && mv kubectl /usr/local/sbin'
		sh 'kubectl version --client'
            }
       } 
      stage("Checkout code") {
            steps {
                checkout scm
            }
       }
       stage("Apply Cilium Network Policies to GKE") {
            steps {
                echo "Cilium Changes started" 
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'cilium-policy.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
       }
   }
}
