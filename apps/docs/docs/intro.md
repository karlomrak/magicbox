---
sidebar_position: -1
---

# Welcome to KOKSMAT MAGICBOX !

KOKSMAT MAGICBOX is a project that aims to consolidate whatever components and integrations which I'm involved in developing. It's a playground for me to try out new things and to learn new things. It's also a place where I can share my knowledge and experience with others. I hope you find it useful.


## What's in KOKSMAT ?

- API wrapping PowerShell command lets for managing Exchange Online, SharePoint Online, Azure AD, PowerApps and Microsoft Teams
- MongoDB for caching copy of data from Exchange Online, SharePoint Online, Azure AD, PowerApps and Microsoft Teams
- Kubernetes configuration for deploying the services

Everything is organized in a Monorepo based on Turbo and PNPM. The project is built using TypeScript and React. 

You get

- NextJS app for exposing the API and the UI
- Integrated Docusaurus 2.0 for documentation and API reference. Utilizing TypeDoc for generating documentation of high level Classes as well as Open API docs reference.
- One single truth for the API. The API documentation and implementation is generated from the ZOD schema. This means that the API documentation is always up to date with the implementation.

