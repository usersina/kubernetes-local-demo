# **Kubernetes Local Demo**
This repository is a simple use case of **kubernetes using minikube**. Aside from minikube-specific commands, you can also execute the same commands in any kubernetes-supported environment.

## **0. Prerequisites**
- [minikube & kubectl](https://minikube.sigs.k8s.io/docs/start/)
- make (optional)

If make is not installed, you can check the `./Makefile` for the needed commands. 

You can run the following commands to check whether minikube is installed:
- minikube version

## **1. Start the cluster**
```BASH
minikube start
```

You can then interact with the cluster by using the dashboard provided by minikube with `minikube dashboard`.

In this repo however, creating various kubernetes components will be done using **kubectl**, the CLI for managing kubernetes.


### References:
- https://minikube.sigs.k8s.io/docs/start/