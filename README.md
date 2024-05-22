
# DEVSECOPS PROJECT 
---
## DIAGRAM 
<img src="./screenshots/devsecops.drawio.svg">

## APPLICATION 
### DIAGRAM 
<center>
<img src="screenshots/application.drawio.svg">
<\center>
 
# HASHICORP VAULT

## Install Vault cluster

### Diagram for k8s cluster
 
 <img src="https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dtutorials%26version%3Dmain%26asset%3Dpublic%252Fimg%252Fvault%252Fkubernetes%252Fdiagram-vault-ns.png%26width%3D994%26height%3D451&w=1080&q=75">

Using Helm install Vault on a local instance of minikube. Vault is installed it's own virtual cluster called a namespace.

  If you have not already, add the HashiCorp Repo.

    $ helm repo add hashicorp https://helm.releases.hashicorp.com

In order to have the latest version of the HashiCorp Helm charts, update the repo.

    $ helm repo update
  Hang tight while we grab the latest from your chart repositories......Successfully got an update from the "hashicorp" chart repository...Successfully got an update from the "open" chart repository...Successfully got an update from the "bitnami" chart repositoryUpdate Complete. ⎈Happy Helming!⎈

Details of the output might differ, the important thing is the Update Complete message.

Determine the latest version of Vault.

    $ helm search repo hashicorp/vault
.

    NAME            CHART VERSION   APP VERSION     DESCRIPTION
    hashicorp/vault 0.23.0          1.13.1          Official HashiCorp Vault Chart

Vault Secrets Operator supports for the latest three versions of Vault. Please see Supported Vault versions for details.

Using the YAML file in /vault install Vault on your Minikube cluster

    $ helm install vault hashicorp/vault -n vault --create-namespace --values vault/vault-values.yaml

The output should resemble the following:

    NAME: vaultLAST 
    DEPLOYED: Fri Mar 31 09:37:42 2023
    NAMESPACE: vault
    STATUS: deployed
    REVISION: 1
    NOTES:Thank you for installing HashiCorp Vault!Now that you have deployed Vault, you should look over the docs on usingVault with Kubernetes available here:https://www.vaultproject.io/docs/Your release is named vault. To learn more about the release, try:
    $ helm status vault
    $ helm get manifest vault


## Configure Vault

### setup Vault cluster

Here you connect to the Vault instance on minikube, enable and configure Kubernetes authentication, KV secrets engine, a role and policy for Kubernetes, and create a static secret.

  Connect to the Vault instance. Until you exit you will be executing from inside the Vault instance.

    $ kubectl exec --stdin=true --tty=true vault-0 -n vault -- /bin/sh

Enable the Kubernetes auth method.

    $ vault auth enable -path demo-auth-mount kubernetes
  Success! Enabled kubernetes auth method at: kubernetes/

Configure the auth method.

    $ vault write auth/demo-auth-mount/config \
       kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443"

The output should resemble the following:

Success! Data written to: auth/demo-auth-mount/config

Enable the kv v2 Secrets Engine.

    $ vault secrets enable -path=kvv2 kv-v2
  Success! Enabled the kv-v2 secrets engine at: kvv2/

Create a read only policy.

    $ vault policy write dev - <<EOF
    path "kvv2/*" {   
       capabilities = ["read"]   
    }
    EOF

The output should resemble the following:

Success! Uploaded policy: dev

Create a role in Vault to enable access to secret.

    $ vault write auth/demo-auth-mount/role/role1 \
       bound_service_account_names=default \
       bound_service_account_namespaces=app \
       policies=dev \
       audience=vault \
       ttl=24h

The output should resemble the following:

 Success! Data written to: auth/demo-auth-mount/role/role1

Notice that the bound_service_account_namespaces is app, limiting where the secret is synced to.

Create a secret.

    $ vault kv put kvv2/webapp/config USER="root" PASS="root" DB="anime_db"
.

    ===== Secret Path =====
    kvv2/data/webapp/config
     ======= Metadata =======
     Key                Value
     ---                -----
     created_time       2023-04-03T16:35:56.1103993Z
     custom_metadata    <nil>
     deletion_time      n/a
     destroyed          false
     version            1

Exit the Vault instance.

    $ exit


Install the Vault Secrets Operator
 <img src="https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dtutorials%26version%3Dmain%26asset%3Dpublic%252Fimg%252Fvault%252Fkubernetes%252Fdiagram-vso.png%26width%3D992%26height%3D451&w=1080&q=75">
Vault Secrets Operator

  Use helm to deploy the Vault Secrets Operator.

    $ helm install vault-secrets-operator hashicorp/vault-secrets-operator -n vault-secrets-operator-system --create-namespace --values vault/vault-operator-values.yaml
    
  NAME: vault-secrets-operator
  LAST DEPLOYED: Fri Mar 31 10:00:29 2023
  NAMESPACE: vault-secrets-operator-system
  STATUS: deployed
  REVISION: 1

Examine the file vault/vault-operator-values.yaml:

    $ cat vault/vault-operator-values.yaml
    
  defaultVaultConnection:   
  enabled: true   
  address: "http://vault.vault.svc.cluster.local:8200"   skipTLSVerify: false... 

  The defaultVaultConnection sets up the default connection to Vault. This is used if no other connection is set.
        address is the address on the Kubernetes cluster.
        skipTLSVerify set to false enables TLS certificate verification.

## Deploy and sync a secret
 <img src="https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dtutorials%26version%3Dmain%26asset%3Dpublic%252Fimg%252Fvault%252Fkubernetes%252Fdiagram-app.png%26width%3D998%26height%3D451&w=1080&q=75">
Create secret in App pod
 
In this section you set up a namespace with a Kubernetes secret. That secret is managed through the Vault Secrets Operator.

  Create a namespace called app on your Kubernetes cluster.

    $ kubectl create ns app
  namespace/app created

Set up the Kubernetes authentication for the secret.

    $ kubectl apply -f vault/vault-auth-static.yaml
    
  vaultauth.secrets.hashicorp.com/static-auth created

Create the secret names secretkv in the app namespace.

    $ kubectl apply -f vault/static-secret.yaml
  vaultstaticsecret.secrets.hashicorp.com/vault-kv-app created


This repo is a companion to [Static secrets with the Vault Secrets Operator on Kubernetes](https://developer.hashicorp.com/vault/tutorials/kubernetes/vault-secrets-operator) found on the [HashiCorp developer](https://developer.hashicorp.com/) site.

---

# ARGOCD

 Install manually

    helm repo add argo https://argoproj.github.io/argo-helm
. update the repo

    helm repo update

. install argocd

    helm install argocd --namespace argocd --create-namespace --version 5.46.8 --values values/argocd.yaml argo/argo-cd
. deploy the manifest

    kubectl apply -f argocd-notifications-secret.yaml -f argocd-notifications-cm.yaml
. frontend , backend and database
    
    kubectl apply -f frontend.yaml -f backend.yaml -f database.yaml

. get pods and svc

    kubectl get pods -n argocd 
    kubectl get svc -n argocd
. login to argocd

    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
    kubectl port-forward svc/argocd-server 8081:80 -n argocd

---

# monitoring


## grafana

### Add helm repo

```
helm repo add grafana https://grafana.github.io/helm-charts
```
---

### Update helm repo

```
helm repo update
```
---

### Install helm 

```
helm install grafana grafana/grafana
```
---

### Expose Grafana Service

```
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext
```

### getting admin password

```bash
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
----
