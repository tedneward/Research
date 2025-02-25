title=Developer Platforms
tags=platform, reading
summary=Notes and links on "developer platforms", a la "internal developer platform".
~~~~~~

## Reading

- [7 Core Elements of an Internal Developer Platform](https://thenewstack.io/7-core-elements-of-an-internal-developer-platform/):

    * **A control plane**: The platform needs a control plane that will be in charge of managing all the resources, no matter if they are applications running in a Kubernetes cluster or elsewhere, or if the infrastructure or services are in Amazon Web Services (AWS) , Azure, Google Cloud or anywhere else. Our recommended tool here is Crossplane.
    * **A control plane interface**: This will enable everyone to interact with the control plane and manage resources at the right level of abstraction. Our recommended tool here is Crossplane Compositions.
    * **Git**: The desired states will be stored in git, so we’ll have to add a GitOps tool into the mix. Its job will be to synchronize whatever we put in git with the control plane cluster. Our recommended tool here is Argo CD.
    * **Database and schema management**: Given that state is inevitable, we will need to have databases as well. Those databases will be managed by the control plane but to work well, we will also need a way to manage schemas inside those databases. Our recommended tool here is SchemaHero.
    * **Secrets manager**: For any confidential information that we cannot store in git, we’ll need a way to manage secrets in a secrets manager. Those secrets can be in any secrets manager. Our recommended tool to pull secrets from there is External Secrets Operator (ESO).
    * **An internal developer portal/ graphical user interface**: In case users don’t want to push manifests directly to git, we should provide them with a user interface that will enable them to see what’s running as well as to execute processes that will create new resources and store them in git. Our recommended tool here is Port.
    * **CI/CD pipelines**: Finally we will need pipelines to execute one-shot actions like the creation of new repositories based on templates, building images with new release changes to manifests and so on. Our recommended tool here is GitHub Actions.

