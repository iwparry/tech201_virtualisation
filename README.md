# DevOps and Development Environments

## DevOps - Notes

### What is DevOps?
Key aspects of DevOps include breaking the silos that keep Developer and Operations teams apart in order
to improve collaboration, share responsibilities, deploy infastructure as code, continuous integration and continuous delivery, microservices, monitoring and logging.

benefits include:
- improved collaboration
- faster, better product delivery
- more stable operating environments
- greater automation
- greater innovation


### What we want our tools to be
- Easy to use - other teams use the tools we create, they won't do so if they aren't user firendly
- Flexible - everything the company uses should be easily updated as the business need changes
- Robust - need close to 100% uptime as possible for our company's services
- Cost - cost is often overlooked, we need to ensure the company is being as efficient as possible in its tech dealings

#### Why its important
- Ease of use - if devs don't use our tools, there will be headache/delays later down the line
- Flexibility - it can be easy to get locked into using a specific product, tool or software and it then becomes hard for a company to keep with industry changes
- Robustness - We are responsible for achieving this as DevOps Engineers
- Cost - e.g. How powerful a machine do we need to conduct a task? Do we need certain servers running? etc.

### Infastructure and Architecture
#### Monolith
A monolithic architecture is a traditional model of a software program, which is built as a unified unit that is self-contained abd independent from other applications.
#### Two tier 
In a two-tier architecture, the client os on the first tier. The database server and web appliction server reside on the same server machine which is the second tier
#### Microservices
A microservice architecture – a variant of the service-oriented architecture structural style – is an architectural pattern that arranges an application as a collection of loosely coupled, fine-grained services, communicating through lightweight protocols.

### Risk Assessment
The 5 principles of risk assessment is
1. Identify hazards
2. Assess the risks
3. Control the risks
4. Record your findings
5. Review the controls


## Development Environments
### What are Dev Environments?
A space that Developers use to write, run and test their codes. These spaces usually have programs and tools configured according to their needs.
### Why are DevOps Engineers developing these environments?
One of the main reasons we need to build these is to ensure consistency accross all environments as opposed to having developers write code in one environment with different tools that may result in issues later on in deployment.
### What makes a Good Dev Environment?
- User firendly, fast and robust
- Flexible (from our perspective - not the devs)
- It should match the production environment as closely as possible
- It should be the same for everyone everywhere
- It should only support one application:
  - App 1 requires version 1.1, App 2 requires version 1.4
  - App 1 needs a specific program that conflicts with the program needed by App 2
