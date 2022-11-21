# Media Processor with AutoScale Ability 
 s3 -> sqs -> CloudwatchAlarm -> AutoScaleGroup -> Ec2 Template

To do List -

- [x] s3 bucket (source, destinition)
- [x] bucket cors, policy
- [x] cloudfront, bucket policy
- [x] sqs queue
- [x] s3 notification to sqs
- [ ] sqs cloudwatch alarm
- [ ] ec2 instance template
- [ ] autoscaling group
<!-- - [ ]  -->

#### Inspiration
![diagram](docs/inspiration-diagram.png)
Architecture Inspiration taken from [Darshil Rathod](https://towardsaws.com/implementing-a-scalable-video-streaming-system-on-aws-4249ce5e8693)
Now implementing it in terraform.

(c) Ashraf Minhaj