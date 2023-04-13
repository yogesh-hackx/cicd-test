# if this is auto-scaling-pipeline, find ip addresses of all the instances present in the autoscaling group, else deploy to the single prod-server
# send build data to s3 excluding the node-modules, .git

aws s3 sync . s3://pvhubdeployments/pay-ally --exclude ".git/*" --exclude "node_modules/*"

ssh -oStrictHostKeyChecking=no -v ec2-user@43.205.240.113 "./deploy.sh"
