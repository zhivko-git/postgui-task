# PostGUI

**A React web application to query and share any PostgreSQL database.**

## Table of Contents
1. [ Origin ](#origin)
2. [ Deployment ](#deployment)

<a name="origin"></a>
## Origin

PostGUI is a React web application that can be found at https://raw.githubusercontent.com/priyank-purohit/PostGUI/

<a name="deployment"></a>
## Deployment

To manually deploy run: kubectl apply -k deploy/env/test/

CI/CD can be easily achived with ArgoCD.
<p align="center">
  <img src="/docs/images/argoCD.png">
</p>

NOTE: the postGUI image in this deployment is just for testing purposes and it is advised build your own image.
- additional telemtry instrumentation for the react app could be nice :)