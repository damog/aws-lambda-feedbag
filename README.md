# AWS Lambda Feedbag

An AWS Lambda function that provides an HTTP API for [Feedbag](https://github.com/damog/feedbag), a Ruby gem for discovering RSS/Atom feeds from URLs.

## Endpoint

```
POST https://fitzwmnm61.execute-api.eu-west-3.amazonaws.com/default/feedbag/find
```

## Usage

Send a URL as the POST body to discover RSS/Atom feeds:

```bash
# Discover feeds from a URL
curl -X POST -d "https://nytimes.com" \
    https://fitzwmnm61.execute-api.eu-west-3.amazonaws.com/default/feedbag/find

# Response:
# {"codeStatus":200,"output":["https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml"]}

# Invalid URL handling
curl -X POST -d "not-a-valid-url@#$" \
    https://fitzwmnm61.execute-api.eu-west-3.amazonaws.com/default/feedbag/find

# Response:
# {"codeStatus":400,"output":"URI::InvalidURIError"}
```

## Development

### Requirements

- Ruby 3.2+ (AWS Lambda supports Ruby 3.4)
- Docker (for container deployment)
- AWS CLI configured with appropriate credentials

### Local Setup

```bash
# Install dependencies
bundle install

# Or use Make
make bundle
```

### Deployment

#### Option 1: Zip Deployment (Traditional)

```bash
make deploy-zip
```

This bundles the code with vendored gems and uploads to Lambda.

#### Option 2: Container Deployment

```bash
# Build the Docker image
make build

# Follow the instructions to push to ECR and update Lambda
make deploy-container
```

### Configuration

Environment variables in the Makefile:

- `FUNCTION_NAME` - Lambda function name (default: `feedbag_find`)
- `AWS_REGION` - AWS region (default: `eu-west-3`)
- `ECR_REPO` - ECR repository name for container deployment (default: `feedbag-lambda`)

## Response Format

```json
{
  "codeStatus": 200,
  "output": ["https://example.com/feed.xml", "https://example.com/atom.xml"]
}
```

### Error Responses

| codeStatus | output | Description |
|------------|--------|-------------|
| 400 | `"No data defined"` | No URL provided in POST body |
| 400 | `"SocketError"` | Network error connecting to URL |
| 400 | `"URI::InvalidURIError"` | Invalid URL format |

## License

Same as [Feedbag](https://github.com/damog/feedbag).
