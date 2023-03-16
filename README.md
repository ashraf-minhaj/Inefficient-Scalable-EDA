# Inefficient Scalable Event Driven Architecture on AWS
 s3 -> sqs -> CloudwatchAlarm -> AutoScaleGroup -> Ec2 Template -> launch instance
 
 This can be used to process large files uploaded on aws s3 bucket when lamba's time is not enough. Found this in a blog post, made it using Terraform. And found it's too much ineffecient and takes very long time to start processing. Good project to start learning AutoScaling on AWS.

#### Inspiration
![diagram](docs/inspiration-diagram.png)
Architecture Inspiration taken from [Darshil Rathod](https://towardsaws.com/implementing-a-scalable-video-streaming-system-on-aws-4249ce5e8693)


get availability zones - `aws ec2 describe-availability-zones --region region-name`

Oh, this [reddit post](https://www.reddit.com/r/aws/comments/aclw37/please_help_with_terraform_script_with/) helped a lot.

(c) Ashraf Minhaj
