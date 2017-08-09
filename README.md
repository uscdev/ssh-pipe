# ssh-pipe
SSH Pipe Container

Create an ssh pipe to an AWS or Azure docker host:

docker run\
 -e SECRET_PATH=/run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem\
 -e USER_HOST=docker@ec2-35-160-115-87.us-west-2.compute.amazonaws.com\
 -it\
 -p 2374:2374\
 -v /run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem:/run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem\
 uscdev/ssh-pipe
