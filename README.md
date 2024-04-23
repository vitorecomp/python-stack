# python-stack
simple stack of a server deployed on gcp

## Instructions

Enable the compute engine API
Enable the artifactregistry API 
Enable the cloud build API 


## commands


```
git clone https://github.com/vitorecomp/python-stack
```

### Build images

```
gcloud artifacts repositories create main-app-image-repo --repository-format=docker --location=us-west1 --description="Main app Image repository"

cd node-server
gcloud builds submit --region=us-west1 --tag us-west1-docker.pkg.dev/$(gcloud config get-value project)/main-app-image-repo/node-server:latest

cd ../next-server
gcloud builds submit --region=us-west1 --tag us-west1-docker.pkg.dev/$(gcloud config get-value project)/main-app-image-repo/next-server:latest

```

### Deploy infra

Take the nodeserver image name and put on main.tf params
Take the nextserver image name and put on main.tf params

```
terraform init
terraform apply
```

## help

to re-run the statup script

https://cloud.google.com/compute/docs/instances/startup-scripts/linux

```
sudo journalctl -u google-startup-scripts.service
sudo google_metadata_script_runner --script-type startup
```
