import boto3

# Let's use Amazon S3
s3 = boto3.resource('s3')
s3_client = boto3.client('s3')


data = open('test.jpg', 'rb')



# Print out bucket names
for bucket in s3.buckets.all():
    print(bucket.name)
    result = s3_client.get_bucket_acl(Bucket=bucket.name)
    print(result)
    #bucket.put_object(Key='test1.jpg', Body=data)
#s3.Bucket('aruncrawltest').put_object(Key='test.jpg', Body=data)
