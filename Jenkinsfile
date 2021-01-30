pipeline { 	
  agent {
    dockerfile {
		 filename 'Dockerfile'
		 reuseNode false
	 }
  } 	
    stages {
      stage('plan') {
	     steps {
			withCredentials([[
				$class: 'AmazonWebServicesCredentialsBinding',
				credentialsId: 'sushilAwsCredentials',
				accessKeyVariable: 'AWS_ACCESS_KEY_ID',
				secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
			]]) {
					sh 'echo `date`'
					//sh 'terraform init -reconfigure'
					sh 'terraform init -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY}'	
					sh 'terraform plan -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY} -auto-approve'
					sh 'echo `date`'
					sh '`pwd`'
				  //sh 'terraform apply -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY} -auto-approve'
				  //sh 'terraform destroy -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY} -force'
				}
			
		}
	}
  }
     /*stages {
       stage('apply') {
	      steps {
			withCredentials([[
				$class: 'AmazonWebServicesCredentialsBinding',
				credentialsId: 'sushilAwsCredentials',
				accessKeyVariable: 'AWS_ACCESS_KEY_ID',
				secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
			]]) {
					sh 'echo `date`'
					sh 'terraform init -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY}'	
					sh 'terraform plan -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY}'
				  sh 'terraform papply -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY}'
			}
	     }
      }
	}*/
    /*stage('approval') {
      options {
        timeout(time: 0.5, unit: 'MINUTES') 
      }*/
      //steps {
        //input 'approve the plan to proceed and apply'
      //}
    }
