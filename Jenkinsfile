pipeline {
    agent any
    
    environment {
        PATH = "$PATH:/Users/juba/flutter/bin"
    }

    stages{
        stage('checkout') { 
            steps {
                git branch:'develop',url:'https://github.com/bouchrasource/APPMobile.git'
                }
            

        }

        stage('clean') {
        			steps {
            			sh 'flutter clean'
            		}	        
        }

        stage('dependencies') {
			steps {
    			sh 'flutter pub get'
    		}
    	}

        stage('test') {
			steps {
    			dir('lib/'){
		                sh 'flutter test'
		            }
    		}	        
        }

        stage('package') {
    			steps {
        			sh 'flutter build apk --release'
        		}
        }

        stage('archive') {
			steps {
			    
				sh 'mv build/app/outputs/flutter-apk/app-release.apk apk-payetonkawa-$BUILD_NUMBER.apk'
				archiveArtifacts artifacts: 'apk-payetonkawa-*.apk', followSymlinks: false

			}        
 		}

        }
    }

