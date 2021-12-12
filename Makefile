test:
	echo "Make is working"

# Deletes all app deployments
delete:
	kubectl delete all -l app=hello-world-rest-api