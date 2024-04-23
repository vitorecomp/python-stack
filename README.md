# python-stack
simple stack of a server deployed on gcp


## commands


```
git clone https://github.com/vitorecomp/python-stack
```

### Build images

```
cd node-server

cd ../next-server
```

### Deploy infra

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
