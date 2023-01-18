# Introduction

## Docker + SQL
* What docker is, and why we need it
* Running postgres with Docker
* Putting some data for testing to local postgres with Python
* Packaging the script in Docker
* Running Postgres and the Script in one network
* Docker compose and running `pgadmin` and `postgres` together with `docker-compose`
* SQL: group by, joins, window function, union

## Docker

* Docker allows you to put everythin an application needs inside a container - sort of a box that contains everything: OS, system-level libraries, Python, etc.
* You run this box on a host machine. The container is completely isolated from the host machine environment.
* In the container for example, you can have Ubuntu 18.04, while your host is running on Windows.
* You can run multiple containers on one host and won't have any conflict.
* Image = a set of instructions that were executed + state. All saved in an image.

### Why should data engineers care about containerization and Docker?

* Setting up locally for experiments
* Integration tests, CI/CD
* Batch jobs (AWS Batch, Kubernetes jobs, etc. -- outside of the scope)
* Spark
* Serverless (AWS Lambda)

Containers are everywhere.

