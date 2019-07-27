import boto3
import sys


ec2 = boto3.client('ec2')
response = ec2.describe_instances()
print(response)
"""
INSTANCE_ID='i-07c4437c2527299f1'
if sys.argv[1] == 'ON':
    response = ec2.monitor_instances(InstanceIds=[INSTANCE_ID])
else:
    response = ec2.unmonitor_instances(InstanceIds=[INSTANCE_ID])
print(response)
"""
