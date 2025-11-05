title=formae
tags=tool, infrastructure as code
summary=A 100% code-based, agentic IaC (Infrastructure-as-Code) tool built from scratch for the modern age.
~~~~~~

[Website](https://platform.engineering/formae) | [Source](https://github.com/platform-engineering-labs/formae)

**formae** doesn't require its user to maintain any secondary artifacts such as state files, and keeps the infrastructure code automatically in sync with the reality.

## **formae** capabilities

-   **The single source of truth is code:** It unifies every infrastructure resource and change into fully versioned infrastructure code.
-   **Always up-to-data infrastructure code:** It sees when things change outside the tool. It merges these changes into your infrastructure code instead of just ignoring or undoing them. This way, important outside changes are never lost, and are immediately incorporated into the infrastructure code.
-   **Prevents avoidable mistakes:** It is built around a very robust, enforced schema.
-   **Made for everyone:** It welcomes all kinds of engineers, whether they are new or experienced, be they in Ops, DevOps, SRE or Platform Engineering.
-   **Perfect for Platform Engineering:** It allows platform engineers to work on the low level of detail, and developers consume reusable services by just providing a few predefined, schema-safe properties.
-   **Built for co-existence:** It is not necessary to migrate or to import anything - **formae** will automatically discover and update resources and happily co-exist with other IaC and Infrastructure Management tools and even ClickOps.
-   **Perfect for Day 0 and onward:** It is equally great for setting up new systems and for making small, safe changes with minimal blast radius as you go.

## How to Use **formae** in Your Organization?

Using **formae** is straightforward and designed to fit various team roles, needs and daily operation scenarios and situations:

-   **Core Platform Engineers:** A small group of engineers with broad responsibilities can manage the main infrastructure code. They can make large, system-wide changes. They often use GitOps (managing infrastructure through Git), but **formae** doesn't enforce this.
    
-   **Engineers with Specific Roles & Developers:** Engineers who are newer, or those who focus on smaller parts of the system, can make small changes. Developers needing to adjust specific resources can also apply these small patches. This keeps the risk of impact (blast radius) very small.
    
-   **On-Call Engineers (Emergency Fixes):** An engineer fixing an urgent issue, even at night, works like those making small changes. No matter their experience, they focus on fixing the problem with minimal risk to other parts of the system. This helps them solve issues quickly and safely.
    
-   **Specialized Teams (Security, Cost Optimization):** Teams that work across different areas, like security or cost-saving groups, can also apply changes as patches. They might not change the core infrastructure, but their changes can affect many parts of the system. **formae** handles these wider-reaching but targeted changes easily.
    
-   **Working with Other Tools:** In many companies, people use different tools to make changes directly in cloud accounts. These could be special security tools or other IaC tools like Terraform, or even ClickOps. **formae** works well alongside them. It detects these external changes and merges them, giving you a consistent, version-controlled and always up-to-date view of your entire infrastructure - **entirely as code**.

## Reading

### Articles

* [New Infrastructure-as-Code Tool "formae" Takes Aim at Terraform](https://www.infoq.com/news/2025/10/iac-formae/)

