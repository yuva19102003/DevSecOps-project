
<div style="text-align: center;">
  <a href="https://golang.org" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/512px-Go_Logo_Blue.svg.png" alt="Golang" width="50" height="50">
  </a>
  <a href="https://developer.mozilla.org/en-US/docs/Web/HTML" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg" alt="HTML" width="50" height="50">
  </a>
  <a href="https://www.mysql.com" target="_blank">
    <img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" alt="MySQL" width="50" height="50">
  </a>
  <a href="https://www.docker.com" target="_blank">
    <img src="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png" alt="Docker" width="50" height="50">
  </a>
  <a href="https://aws.amazon.com/eks/" target="_blank">
    <img src="https://d1.awsstatic.com/logos/aws_logo_smile_1200x630.5d1149417550b98c55b8af1450493b6e7fb8d0b8.png" alt="EKS" width="50" height="50">
  </a>
  <a href="https://www.terraform.io" target="_blank">
    <img src="https://www.datocms-assets.com/2885/1629941242-brandhcterraformprimary2colorwhitebackgroundrgb.svg" alt="Terraform" width="50" height="50">
  </a>
  <a href="https://www.vaultproject.io" target="_blank">
    <img src="https://www.datocms-assets.com/2885/1629941243-brandhc_vaultprimary2colorwhitebackgroundrgb.svg" alt="Hashicorp Vault" width="50" height="50">
  </a>
  <a href="https://argo-cd.readthedocs.io/en/stable/" target="_blank">
    <img src="https://argo-cd.readthedocs.io/en/stable/assets/logo.png" alt="ArgoCD" width="50" height="50">
  </a>
  <a href="https://aws.amazon.com/cloudwatch/" target="_blank">
    <img src="https://d1.awsstatic.com/logos/aws_logo_smile_1200x630.5d1149417550b98c55b8af1450493b6e7fb8d0b8.png" alt="CloudWatch" width="50" height="50">
  </a>
  <a href="https://grafana.com" target="_blank">
    <img src="https://grafana.com/static/img/menu/logo2.svg" alt="Grafana" width="50" height="50">
  </a>
  <a href="https://slack.com" target="_blank">
    <img src="https://a.slack-edge.com/80588/marketing/img/icons/icon_slack_hash_colored.png" alt="Slack" width="50" height="50">
  </a>
  <a href="https://github.com/features/actions" target="_blank">
    <img src="https://avatars.githubusercontent.com/u/44036562?s=200&v=4" alt="GitHub Action" width="50" height="50">
  </a>
  <a href="https://snyk.io" target="_blank">
    <img src="https://snyk.io/wp-content/uploads/2020/10/snyk-logo.png" alt="Snyk Scan" width="50" height="50">
  </a>
</div>







# DEVSECOPS PROJECT 
---
## DIAGRAM 
<img src="./screenshots/devsecops.drawio.svg">

## APPLICATION 

# Random Anime Quote Generator

This repository contains a three-tier microservices application that generates random anime quotes. The application is composed of the following tiers:
- **Frontend**: Built with Golang and HTML
- **Backend**: Golang API using the Gin framework
- **Database**: MySQL

## Architecture

- **Frontend**: Serves the HTML page and handles user interactions.
- **Backend**: Provides API endpoints for fetching random quotes.
- **Database**: Stores the anime quotes.

## Technologies Used

<div style="text-align: center;">
  <a href="https://golang.org" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/512px-Go_Logo_Blue.svg.png" alt="Golang" width="50" height="50">
  </a>
  <a href="https://developer.mozilla.org/en-US/docs/Web/HTML" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg" alt="HTML" width="50" height="50">
  </a>
  <a href="https://www.mysql.com" target="_blank">
    <img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" alt="MySQL" width="50" height="50">
  </a>
  <a href="https://gin-gonic.com" target="_blank">
    <img src="https://raw.githubusercontent.com/gin-gonic/logo/master/color.png" alt="Gin Framework" width="50" height="50">
  </a>
</div>

## Getting Started

### Prerequisites

- [Golang](https://golang.org/dl/)
- [MySQL](https://www.mysql.com/downloads/)
- [Gin](https://github.com/gin-gonic/gin)

### Setting Up the Database

1. Install MySQL and start the MySQL service.
2. Create a database named `quotes`.
3. Create a table `anime_quotes` with the following schema:

```sql
CREATE TABLE anime_quotes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quote TEXT NOT NULL,
    author VARCHAR(255) NOT NULL
);
```

### DIAGRAM 
<img src="screenshots/application.drawio.svg">

4. Insert some quotes into the `anime_quotes` table:

```sql
INSERT INTO anime_quotes (quote, author) VALUES
('Knowing what it feels to be in pain, is exactly why we try to be kind to others', 'Jiraiya'),
('I\'ll leave tomorrow\'s problems to tomorrow\'s me.', 'Saitama'),
('In the end, it doesn\'t matter what anyone else thinks, because I believe in myself.', 'Naruto Uzumaki');
```

### Running the Backend

1. Navigate to the `backend` directory.
2. Install the required dependencies.
3. Create a `config.go` file with your database connection details.
4. Start the backend server.

### Running the Frontend

1. Navigate to the `frontend` directory.
2. Create the necessary HTML templates.
3. Start the frontend server.

### Accessing the Application

Open your web browser and go to `http://localhost:8080` to access the Random Anime Quote Generator.

## Project Structure

```
.
├── backend
│   ├── main.go
│   ├── config.go
│   └── quotes.go
├── frontend
│   ├── main.go
│   └── templates
│       └── index.html
└── README.md
```

## Backend (Gin API)

- `main.go`: Initializes the Gin server and sets up the routes.
- `config.go`: Contains the database connection logic.
- `quotes.go`: Contains the logic for fetching random quotes from the database.

## Frontend (Golang and HTML)

- `main.go`: Serves the HTML page and handles requests.
- `templates/index.html`: The HTML template for the frontend.

 
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
