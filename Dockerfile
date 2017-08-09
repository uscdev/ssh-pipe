FROM ubuntu

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y openssh-client

RUN mkdir ~/.ssh && printf "Host *\n AddressFamily inet\n StrictHostKeyChecking no\n UserKnownHostsFile=/dev/null" > ~/.ssh/config
# RUN mkdir ~/.ssh && printf "Host *\n AddressFamily inet" > ~/.ssh/config
# RUN printf "ssh -NL \$HOSTNAME:2374:/var/run/docker.sock -i /run/secrets/keys/aws/ssh/usc/its-bsa-dev-us-west-2-key-pair.pem docker@ec2-35-160-115-87.us-west-2.compute.amazonaws.com" > go.sh
RUN printf "ssh -NL \$HOSTNAME:2374:/var/run/docker.sock -i \$SECRET_PATH \$USER_HOST" > /go.sh
# RUN printf "echo hello \$HOSTNAME fred \$ABC mary $1 $2 $3" > /go.sh
RUN chmod a+x /go.sh

ENTRYPOINT ["/bin/bash", "-c", "/go.sh"]
