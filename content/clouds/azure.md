title=Azure
tags=cloud
summary=Huge collection of cloud services.
~~~~~~

[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/)

### Basics 

[Static HTML site in Azure](https://docs.microsoft.com/en-us/azure/app-service/quickstart-html): Using Azure Cloud Shell or CLI

[Map DNS](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-custom-domain)

#### What is an Azure account?
*(from https://docs.microsoft.com/en-us/azure/guides/developer/azure-developer-guide)*

To create or work with an Azure subscription, you must have an Azure account. An Azure account is simply an identity in Azure AD or in a directory, such as a work or school organization, that Azure AD trusts. If you don't belong to such an organization, you can always create a subscription by using your Microsoft Account, which is trusted by Azure AD. To learn more about integrating on-premises Windows Server Active Directory with Azure AD, see Integrating your on-premises identities with Azure Active Directory.

Every Azure subscription has a trust relationship with an Azure AD instance. This means that it trusts that directory to authenticate users, services, and devices. Multiple subscriptions can trust the same directory, but a subscription trusts only one directory. To learn more, see How Azure subscriptions are associated with Azure Active Directory.

As well as defining individual Azure account identities, also called users, you can define groups in Azure AD. Creating user groups is a good way to manage access to resources in a subscription by using role-based access control (RBAC). To learn how to create groups, see Create a group in Azure Active Directory preview. You can also create and manage groups by using PowerShell.

#### Manage your subscriptions
A subscription is a logical grouping of Azure services that is linked to an Azure account. A single Azure account can contain multiple subscriptions. Billing for Azure services is done on a per-subscription basis. For a list of the available subscription offers by type, see Microsoft Azure Offer Details. Azure subscriptions have an Account Administrator who has full control over the subscription. They also have a Service Administrator who has control over all services in the subscription.

#### Resource groups
When you provision new Azure services, you do so in a given subscription. Individual Azure services, which are also called resources, are created in the context of a resource group. Resource groups make it easier to deploy and manage your application's resources. A resource group should contain all the resources for your application that you want to work with as a unit. You can move resources between resource groups and even to different subscriptions.

The Azure Resource Explorer is a great tool for visualizing the resources that you've already created in your subscription. To learn more, see Use Azure Resource Explorer to view and modify resources.

When you allow access to Azure resources, it's always a best practice to provide users with the least privilege that's required to do a given task.

Azure role-based access control (Azure RBAC): In Azure, you can grant access to user accounts (principals) at a specified scope: subscription, resource group, or individual resources. Azure RBAC lets you deploy resources into a resource group and grant permissions to a specific user or group. It also lets you limit access to only the resources that belong to the target resource group. You can also grant access to a single resource, such as a virtual machine or virtual network. To grant access, you assign a role to the user, group, or service principal. There are many predefined roles, and you can also define your own custom roles.

Service principal objects: Along with providing access to user principals and groups, you can grant the same access to a service principal.

