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

Note that make is simply used for convenience, if you don't have it installed or want to explore the commands you can check the `./Makefile`.

You can run the following commands to check whether minikube is installed:
- minikube version

## **1. Getting started**
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

## **2. Testing a simple deployment (using the shell)**
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

## **3. Deploying a web application (from YAML)**
Instead of manually creating resources using `kubectl` commands, you can directly apply the **YAML** files, which represent the desired state of our cluster

```BASH
make apply-all
```

## **4. Interacting with the kubernetes cluster**

You can then interact with the cluster to see the created resources with
```BASH
kubectl get all
```
You might notice that both or one of the pods has a status of `ContainerCreating`. That's because the public node & webapp images are still being pulled from dockerhub. After a while, they should be updated to `Running`.

You can get more details by checking the **Events** section after running:
```BASH
kubectl describe pods

# or

kubectl get pod
kubectl describe pod your-pod-name
```

To check the logs of either of the pods:

```BASH
kubectl get pod
kubectl logs your-pod-name
```

## **5. Accessing the app**

To get the list of services
```BASH
kubect get services
```

Simply forward the service running at 3000 to the local machine at port 80
```BASH
kubectl port-forward service/webapp-service 80:3000
```

The app should then be available on
> http://localhost


### References:
- https://minikube.sigs.k8s.io/docs/start/
- https://kubernetes.io/docs/home/
- https://hub.docker.com/