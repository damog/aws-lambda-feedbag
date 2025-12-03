.PHONY: deploy deploy-zip deploy-container build clean bundle

# Function name in AWS Lambda
FUNCTION_NAME ?= feedbag_find
AWS_REGION ?= eu-west-3
ECR_REPO ?= feedbag-lambda

# Deploy using zip (for non-container Lambda)
deploy-zip: bundle
	rm -f deploy.zip
	zip -q -r deploy.zip lambda_feedbag.rb vendor/
	aws lambda update-function-code \
		--function-name $(FUNCTION_NAME) \
		--zip-file fileb://deploy.zip \
		--region $(AWS_REGION)

# Build Docker image for container-based Lambda
build:
	docker build -t $(ECR_REPO):latest .

# Deploy using container image
deploy-container: build
	@echo "To deploy as container, push to ECR and update Lambda to use the image"
	@echo "1. aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin YOUR_ACCOUNT_ID.dkr.ecr.$(AWS_REGION).amazonaws.com"
	@echo "2. docker tag $(ECR_REPO):latest YOUR_ACCOUNT_ID.dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO):latest"
	@echo "3. docker push YOUR_ACCOUNT_ID.dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO):latest"
	@echo "4. aws lambda update-function-code --function-name $(FUNCTION_NAME) --image-uri YOUR_ACCOUNT_ID.dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO):latest"

# Install dependencies locally (for zip deployment)
bundle:
	bundle config set --local path 'vendor/bundle'
	bundle install

# Clean build artifacts
clean:
	rm -f deploy.zip
	rm -rf vendor/bundle

# Legacy deploy (alias for deploy-zip)
deploy: deploy-zip
