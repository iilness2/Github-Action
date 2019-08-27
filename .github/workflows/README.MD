# Cloud Engineering Github Actions

## Highlights

1. Automated mechanism to deploy HOOQ service infrastructures
1. Using Github Actions CI/CD pipeline to deploy service infrastructures

## Mechanism

1. Using `pull_request` github event to deploy HOOQ service infrastructure in development environment.
1. Using `release` github event to deploy HOOQ service infrastructure in production environment.
1. Using terraform remote state files stored at terraform cloud workspace.
1. Each terraform workspace name represented by HOOQ service name.
1. Each secret key and token stored at github action secret.

## References

https://help.github.com/en/articles/about-github-actions
https://help.github.com/en/articles/events-that-trigger-workflows
https://help.github.com/en/articles/workflow-syntax-for-github-actions#jobsjob_idsteps


