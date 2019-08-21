# Module asg_scaling_policy

### Resources
- aws_autoscaling_policy (Scale up)
- aws_autoscaling_policy (Scale down)
- aws_cloudwatch_metric_alarm for - instances_cpu_high, instances_cpu_low

### Input
```sh
variable "namespace" {
  description = "Alaram matric launch config"
}

variable "asg_name" {
  description = "alarm will be attached to this dimension"
}

variable "instances_cpu_high_threshold" {
  description = "Threshold value for instances_cpu_high cloud watch alaram"
}

variable "instances_cpu_low_threshold" {
  description = "Threshold value for instances_cpu_low cloud watch alaram"
}

```

### How to use as variables.tfvars
```sh
namespace = ""
asg_name = ""
instances_cpu_high_threshold = 65
instances_cpu_low_threshold = 45
```