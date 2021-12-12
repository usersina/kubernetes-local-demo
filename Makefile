test:
	echo "Make is working"

###################### Main commands ######################
# Creates a simple deployment
deploy-hello-world:
	kubectl create deployment hello-world-rest-api --image=in28min/hello-world-rest-api:0.0.1.RELEASE && \
	kubectl expose deployment hello-world-rest-api --type=NodePort --port=8080

# Make the hello-world-rest-api deployment accessible from our local machine
forward-hello-world:
	kubectl port-forward service/hello-world-rest-api 8080:8080

# Delete everything related to the deployment (pods, services, etc)
delete-hello-world:
	kubectl delete all -l app=hello-world-rest-api
###########################################################