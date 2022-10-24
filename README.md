# Spinnaker Summit 2022

This repository covers materials from the Spinnaker Summit 2022 conference.

## Usage

The demo leverages EKS Blueprints and the Spinnaker Operator to create a simple
evaluation instance.

### AWS Setup

Follow the [Getting Started][eks-getting-started] guide to create a Kubernetes
cluster.

### Spinnaker Operator

The Spinnaker Operator is a Kubernetes operator used to manage the lifecycle of
Spinnaker clusters. It monitors `SpinnakerService` [Custom Resource Definitions
(CRDs)][crds] and manages the complete lifecycle of Spinnaker clusters.

First, download the resources that we'll apply to the cluster:

```bash
bash -c 'curl -L https://github.com/armory/spinnaker-operator/releases/latest/download/manifests.tgz | tar -xz'
```

Then, apply the CRDs for the Spinnaker Operator:

```bash
kubectl apply -f deploy/crds/
```

We'll need a namespace to deploy the Spinnaker Operator into, so create that
next:

```bash
kubectl create ns spinnaker-operator
```

Finally, install the Spinnaker Operator into the namespace that was just
created:

```bash
kubectl -n spinnaker-operator apply -f deploy/cluster/
```

### Spinnaker

## Resources

- [EKS Blueprint](https://aws-ia.github.io/terraform-aws-eks-blueprints/v4.1.0/)
- [EKS Best Practices](https://aws.github.io/aws-eks-best-practices/)
- [EKS Immersion Workshop](https://catalog.workshops.aws/eks-immersionday/en-US)
- [Spinnaker Kustomize Patches](https://github.com/armory/spinnaker-kustomize-patches)
- [Slides](https://docs.google.com/presentation/d/1PLlVvCKW3iVNigIYvEkMJ0vWn1SLYo-n5gYYbfjr4xA/edit?usp=sharing)
- [Contribute to Spinnaker!](https://spinnaker.io/docs/community/)

[eks-getting-started]: https://aws-ia.github.io/terraform-aws-eks-blueprints/v4.1.0/getting-started/
[crds]: https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/
