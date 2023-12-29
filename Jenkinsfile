pipeline {
	agent any

    environment {
        ECRURL = '851227637779.dkr.ecr.us-east-1.amazonaws.com'
    }
	
	stages {
		stage('pull image') {
            		steps {
		        	script{
				    sh("eval \$(aws ecr get-login --no-include-email --region us-east-1)")
					docker.withRegistry("https://" + ECRURL) {
						docker.image("reactome-schemas:latest").pull()
					}
			    	}
		    	}
        	}
		// This stage generates graph-core-curator classes, validates them against those in feature/graph-core-curator-reformat
		// branch of graph-core-curator, and then generates graphql
		stage('Main: graph-core-curator'){
			steps{
				script{
                    sh "git clone git@github.com:reactome/graph-core-curator.git"
                    sh "push graph-core-curator"
                    sh "git checkout feature/graph-core-curator-reformat"
                    sh "pop"
                    sh "./generate.py java"
                    sh "./compare_java.py curator-graph-core-classes graph-core-curator/src/main/java/org/reactome/server/graph/curator/domain/ > diff.txt"
                    sh "if [ -s diff.txt ]; then echo 'ERROR: The following differences exist between generated and original graph-core-curator classes: ''; cat diff.txt; exit 1; fi"
                    sh "./generate.py graphql"
				}
			}
		}
		// This stage generates graph-core classes, validates them against those in feature/graph-core-reformat
		// branch of graph-core, and then generates graphql
		stage('Main: graph-core-curator'){
			steps{
				script{
                    sh "git clone git@github.com:reactome/graph-core.git"
                    sh "push graph-core"
                    sh "git checkout feature/graph-core-reformat"
                    sh "pop"
                    sh "./generate.py java schema.web.diff.yaml"
                    sh "./compare_java.py graph-core-classes graph-core/src/main/java/org/reactome/server/graph/domain > diff.txt"
                    sh "if [ -s diff.txt ]; then echo 'ERROR: The following differences exist between generated and original graph-core classes: ''; cat diff.txt; exit 1; fi"
                    sh "./generate.py graphql schema.web.diff.yaml "
				}
			}
		}
	}
}
