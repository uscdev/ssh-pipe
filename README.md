# ssh-pipe
SSH Pipe Container

Create an ssh pipe to an AWS host:

This container sets up an SSH pipe to your Amazon docker host.

1. Mount the AWS secret file in the container path.
2. Pass the location of the secret file in the SECRET_PATH environment variable.
3. Pass the user and host name in the USER_HOST environment variable.
4. Map port 2374 to a local port

Here's an example:
````bash
docker run\
 -it\
 -p 2374:2374\
 -v /run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem:/run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem\
 -e SECRET_PATH=/run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem\
 -e USER_HOST=docker@ec2-35-160-115-87.us-west-2.compute.amazonaws.com\
 uscdev/ssh-pipe
````

Next, open another terminal windows and set the docker host:
````bash
export DOCKER_HOST=:2374
````

Now you are ready to execute docker commands against your remote swarm.
