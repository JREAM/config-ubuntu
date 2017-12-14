# AWS CLI

There are MANY options to the AWS CLI due to the amount of services. For full references
visit: [http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-using.html](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-using.html)

## Create Credentials

To configure the `[default]` do not pass a flag.
```
aws configure
```

Configure per user_profile
```
aws configure --profile user2
```

**Example Prompt Data**
```
AWS Access Key ID [None]: AKIAI44QH8DHBEXAMPLE
AWS Secret Access Key [None]: je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: json
```

### CLI Flags

- `--profile` - name of user in ~/.aws/credentials `[username`]
- `--region` - us-west-2, us-west-1, us-east-2
- `--output` - text, json table
- `--endpoint-url` -

### Switching Global Profiles

```
export AWS_DEFAULT_PROFILE=user2
```

### Environment Variables are Supported

**Example**
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```

# Getting Details
```
aws ec2 describe-instances --profile user2
aws ec2 describe-instances --output table --region us-east-1
```


