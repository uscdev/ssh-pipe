# ssh-pipe
SSH Pipe Container

Create an ssh pipe to an AWS or Azure docker host:

````bash
docker run\
 -it\
 -p 2374:2374\
 -v /run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem:/run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem\
 -e SECRET_PATH=/run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem\
 -e USER_HOST=docker@ec2-35-160-115-87.us-west-2.compute.amazonaws.com\
 uscdev/ssh-pipe
````

Then, open another terminal windows and set the docker host:
````bash
export DOCKER_HOST=:2374
````

Now you are ready to execute docker commands against your remote swarm.