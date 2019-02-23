Source code for the AWS Lambda function and environment that runs a simple [Feedbag](https://github.com/damog/github) service:

```
➜  /home/damog $ echo "damog.net/blog" | curl -d @- -w "\n" https://fitzwmnm61.execute-api.eu-west-3.amazonaws.com/default/feedbag/find

{"codeStatus":200,"output":["http://damog.net/blog/atom.xml"]}

➜  /home/damog $ echo "nytimes.com@#$@#" | curl -d @- -w "\n" https://fitzwmnm61.execute-api.eu-west-3.amazonaws.com/default/feedbag/find

{"codeStatus":400,"output":"URI::InvalidURIError"}

```

