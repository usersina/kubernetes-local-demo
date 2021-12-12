test:
	echo "Make is working"

###################### Hello world deployment ######################
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
####################################################################



###################### Main app deployment #########################
# Creates all of the resources defined in YAML
apply-all:
	kubectl apply -f mongo-config.yaml && \
	kubectl apply -f mongo-secret.yaml && \
	kubectl apply -f mongo.yaml && \
	kubectl apply -f webapp.yaml

# Deletes all resources with specified labels
delete-all:
	kubectl delete all -l app=mongo && \
	kubectl delete all -l app=webapp && \
	kubectl delete configmap mongo-config && \
	kubectl delete secret mongo-secret
####################################################################