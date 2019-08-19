// Load the AWS SDK
const aws = require('aws-sdk');
const s3 = new aws.S3();

// Define 2 new variables for the source and destination buckets
var srcBucket = "YOUR-SOURCE-BUCKET";
var destBucket = "YOUR-DESTINATION-BUCKET";
var sourceObject = "YOUR-SOURCE-OBJECT";

//Main function
exports.handler = (event, context, callback) => {

//Copy the current object to the destination bucket
http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3.html#copyObject-property
s3.copyObject({ 
    CopySource: srcBucket + '/' + sourceObject,
    Bucket: destBucket,
    Key: sourceObject
    }, function(copyErr, copyData){
       if (copyErr) {
            console.log("Error: " + copyErr);
         } else {
            console.log('Copied OK');
         } 
    });
  callback(null, 'All done!');
};
