pipeline {
    agent any
    environment {
        TERRAFORM_CMD = 'terraform'
    }
    stages {
        stage('checkout repo') {
            steps {
              checkout scm
            }
        }
        stage('init') {
            steps {
                sh  """
                    ${TERRAFORM_CMD} init  -input=false
                    """
            }
        }
        stage('plan') {
            steps {
                sh  """
                    ${TERRAFORM_CMD} plan -out=tfplan -input=false 
                    """
                script {
                  timeout(time: 10, unit: 'MINUTES') {
                    input(id: "Deploy Gate", message: "Deploy ${params.project_name}?", ok: 'Deploy')
                  }
                }
            }
        }
        stage('apply') {
            steps {
                sh  """
                    ${TERRAFORM_CMD} apply -lock=false -input=false tfplan
                    """

}
        }
    }
}
