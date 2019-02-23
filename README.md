Description
-----------

Source code for the AWS Lambda function and environment that runs a simple [Feedbag](https://github.com/damog/feedbag) service:

```
$ echo "damog.net/blog" | curl -d @- \
    https://fitzwmnm61.execute-api.eu-west-3.amazonaws.com/default/feedbag/find

{"codeStatus":200,"output":["http://damog.net/blog/atom.xml"]}

$ echo "nytimes.com@#$@#" | curl -d @- \
    https://fitzwmnm61.execute-api.eu-west-3.amazonaws.com/default/feedbag/find

{"codeStatus":400,"output":"URI::InvalidURIError"}
```

Endpoint
--------
https://fitzwmnm61.execute-api.eu-west-3.amazonaws.com/default/feedbag/find

Same as `Feedbag.find()`, POST the URL as a string directly into the endpoint. It'll return JSON.


