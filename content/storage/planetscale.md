title=PlanetScale
tags=storage, relational
summary=A serverless MySQL platform based on the Vitess horizontal scaling MySQL technology.
~~~~~~

[Website](https://planetscale.com/) | Commercial

What’s interesting about PlanetScale is that it’s a branching database, a novel workflow that has emerged only recently but appears to be quite promising. But what is a branching database? A branching database allows you to create different branches from your main database that you can use for different purposes. You can imagine this workflow as something very similar to a version control system like Git where you make changes to a project without breaking the entire codebase.

You can create a copy of your main or production database into a separate database branch. Then, you can experiment in that database branch, make changes and when you’re completely satisfied with them, merge them back to your main database. Thus it’s highly efficient and intuitive to play around and experiment with your database while keeping your production database intact.

PlanetScale also adds branches to your database so you can test schema changes on an isolated development branch. This branch is separate from the production branch or your main database. This provides an isolated working environment without explicitly creating a staging or testing environment for experimenting with schema changes. You can read more on what branching means and how PlanetScale uses this concept in their documentation page.

PlanetScale automatically creates daily backups and protects direct schema changes on your production branch right out of the box, reducing the possibility of accidentally corrupting the production database.

Non-blocking schema changes are yet another interesting feature it provides. You can create and deploy a request to update your tables without disrupting your users when you want to change your database schema. It is also simple to integrate with third-party tools like Prisma.

Prisma is an open-source database toolkit that provides a type-safe ORM (Object-Relational Mapping) layer for modern web applications. When you want to change your database schema, you can use Prisma’s migration feature to generate the necessary SQL scripts that can be applied to your database in a non-blocking way, without disrupting your users. This way you can integrate your PlanetScale with Prisma to efficiently update your schema whilst your application remains online. 

