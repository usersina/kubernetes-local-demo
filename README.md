# **Kubernetes Local Demo**
<!-- This demo is a complete application which consists of:
1. A mongodb database
2. A web application -->
This demo consists of a **mongodb database** and a **web application** deployed inside of a kubernetes cluster where the web app communicates with the database using external configuration data from **ConfigMap** & **Secret**.

A **Service** is then used to expose the web app externally in the browser.

Aside from starting & stopping the cluster using **minikube**, you can also make the deployment in any kubernetes-supported environment.

## **0. Prerequisites**
- [minikube*](https://minikube.sigs.k8s.io/docs/start/)
- [docker*](https://www.docker.com/get-started) (preferrably) or any other container runtime to start minikube in
- make (optional)

If make is not installed, you can check the `./Makefile` for the needed commands. 

You can run the following commands to check whether minikube is installed:
- minikube version

## **1.a Getting started**
Run the local kubernetes cluster
```BASH
minikube start --driver docker
```
Check the cluster status
```BASH
minikube status
```

You can then interact with the cluster by using the dashboard provided by minikube with `minikube dashboard`.

In this repo however, creating various kubernetes components will be done using **kubectl**, the CLI for managing kubernetes.

## **1.b Testing a simple deployment (using the shell)**
Create & expose a simple hello world deployment
```BASH
make deploy-hello-world
```

Make the deployed app accessible from the local machine
```BASH
make forward-hello-world
```

You can now check if everything is working as intended by visiting:

> http://127.0.0.1:8080/hello-world

To delete the test deployment & its services
```BASH
make delete-hello-world
```



### References:
- https://minikube.sigs.k8s.io/docs/start/
- https://kubernetes.io/docs/home/
- https://hub.docker.com/