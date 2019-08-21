tf-state-region                     = "ap-southeast-1"
tf-state-environment                = "env:/playground"
tf-state-bucket-name                = "hooq-terraform-remote-state"
cluster-name                        = "Miyazaki"

### ALB values
enable-access-log                   = true
enable-http2                        = true
enable-cross-zone-load-balancing    = true
access-log-bucket-name              = "logbucket-name"
internal-lb-value                   = true

### Target Group
alb-target-group-port = 80
alb-health-check-path = "/1.0"
http-code = "200"
cert-arn = ""

### Tags
environment = "Playground"
entity = "hooq"
managedby = "CloudCover"
owner = "Miyazaki-Team"
service-name = "miyazaki"
versions = "0.1"