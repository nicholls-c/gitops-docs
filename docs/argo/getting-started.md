# Getting Started

## Clone Template Directory

There is a starter repository that can be cloned that will help boostrap a new local cluster.

1. Navigate to [gitops-template repository](https://github.com/nicholls-c/gitops-template)
2. Clone locally with the _Use this template_ button:
3. Click _Create a new repository_
   ![Template Repo](./images/template-repo.png){ align=left }
4. Add an _Owner_, _Repository Name_ and change the visibility under Configuration to _Private_:
   ![Repo Options](./images/input-options.png){ align=left }
5. Click _Create repository_
6. GitHub should create the repository and take you to it.
7. Grab git clone url: _Code_ > _Local_ > _SSH_ > Copy
8. In bash, execute `git clone <pasted_content>`
9. Open in IDE of choice: `cd <repo_name> && code .`

## App-of-Apps

We can now bootstrap our cluster with our Argo [App-of-Apps](https://argo-cd.readthedocs.io/en/latest/operator-manual/cluster-bootstrapping/).

Apply our Argo bootstrap app to your minikube cluster:
```bash
kubectl apply -f argo/app-of-apps.yaml
```

The ArgoUI should now show our app-of-apps:
![AppOfApps](images/app-of-apps.png)