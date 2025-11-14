
sh-5.2$ sudo -u ec2-user -i
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$ whoami
ec2-user
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$ pwd
/home/ec2-user
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$ ls -ltr
total 203080
-rw-r--r--. 1 ec2-user ec2-user 122262469 Oct  6 21:04 kafka_2.12-3.9.1.tgz
rw-r--r--. 1 ec2-user ec2-user  85686001 Oct 13 17:12 venv.tar.gz
drwxr-xr-x. 7 ec2-user ec2-user       105 Nov 13 04:32 kafka
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$ ### Set up client config for IAM authentication:
{
cat <<EOF
security.protocol=SASL_SSL
sasl.mechanism=AWS_MSK_IAM
sasl.jaas.config=software.amazon.msk.auth.iam.IAMLoginModule required;
sasl.client.callback.handler.class=software.amazon.msk.auth.iam.IAMClientCallbackHandler
EOF
} > kafka/bin/client.properties
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$ ls -ltr
total 203080
-rw-r--r--. 1 ec2-user ec2-user 122262469 Oct  6 21:04 kafka_2.12-3.9.1.tgz
-rw-r--r--. 1 ec2-user ec2-user  85686001 Oct 13 17:12 venv.tar.gz
drwxr-xr-x. 7 ec2-user ec2-user       105 Nov 13 04:32 kafka
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$ more kafka/bin/client.properties
security.protocol=SASL_SSL
sasl.mechanism=AWS_MSK_IAM
sasl.jaas.config=software.amazon.msk.auth.iam.IAMLoginModule required;
sasl.client.callback.handler.class=software.amazon.msk.auth.iam.IAMClientCallbackHandler
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$ export MSK_STACK="anomaly-cfn"
TOKEN=`curl -X PUT -s "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
export AWS_DEFAULT_REGION=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/region)

### Get broker URLs to connect to Kafka

export SOURCE_BROKERS=$(aws cloudformation describe-stacks --stack-name $MSK_STACK --query 'Stacks[0].Outputs[?OutputKey==`MSKClusterBrokerString`].OutputValue' --output text)

cd ~/kafka/bin

### List all topics
./kafka-topics.sh \
    --list \
    --bootstrap-server "${SOURCE_BROKERS}" \
    --command-config client.properties
flow-log-egress
flow-log-ingest
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 bin]$ ./kafka-console-consumer.sh \
    --bootstrap-server "${SOURCE_BROKERS}" \
    --topic flow-log-egress \
    --consumer.config client.properties | jq .
