## App-of-Apps

You can now create an Argo ["App-of-Apps"](https://argo-cd.readthedocs.io/en/latest/operator-manual/cluster-bootstrapping/). Essentialy, this is an Argo Application that bootstraps other argo applications.

Update your repository details as required.

```yaml
---
# yaml-language-server: $schema=https://github.com/datreeio/CRDs-catalog/raw/refs/heads/main/argoproj.io/application_v1alpha1.json
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: app-of-apps
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  sources:
    - repoURL: git@github.com:nicholls-c/awesome-gitops.git
      path: argo/apps
      targetRevision: HEAD
      directory:
        recurse: true
        include: "*-application.yaml"
    - repoURL: git@github.com:nicholls-c/awesome-gitops.git
      path: argo/projects
      targetRevision: HEAD
      directory:
        recurse: true
        include: "*.yaml"

  destination:
    server: https://kubernetes.default.svc
    namespace: argocd

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
```

Noteworthy here is that we will use this app to managed any applications in source control matching this pattern:
`*-application.yaml`. As long as you create an argo app with that naming pattern, this application will manage it.

Also of note is that in this example, we create custom argo `projects` (containers to hold argo applications for better navigation and organisation).