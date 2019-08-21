package test

import (
	"log"
	"os"
	"path"
	"testing"

	"github.com/HOOQTV/cloud-engineering/terratest/network"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

var networkStack *network.NetworkStack
var awsRegion = os.Getenv("AWS_REGION")
var gopath = os.Getenv("GOPATH")
var terraformDir = path.Join(gopath, "src/github.com/HOOQTV/cloud-engineering/services/miyazaki/network")
var terraformOptions = &terraform.Options{
	// The path to where our Terraform code is located
	TerraformDir: terraformDir,

	// Var files
	VarFiles: []string{"play-variables.tfvars"},
	Targets:  []string{"module.vpc"},

	// Environment variables to set when running Terraform
	EnvVars: map[string]string{
		"AWS_DEFAULT_REGION": awsRegion,
	},
}

func TestMiyazakiNetwork(t *testing.T) {

	networkStack = network.NewNetworkStack(t, terraformOptions)

	vpcTestResult := networkStack.TestVPC(terraformOptions, awsRegion)

	subnetTestResult := networkStack.TestSubnet(terraformOptions, awsRegion)

	igwTestResult := networkStack.TestIGW(terraformOptions, awsRegion)

	routeTableTestResult := networkStack.TestRouteTable(terraformOptions, awsRegion)

	log.Println(igwTestResult)

	log.Println(vpcTestResult)

	log.Println(subnetTestResult)

	log.Println(routeTableTestResult)

}
