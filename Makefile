deploy:
	rm deploy.zip
	zip -q -x Makefile -r deploy.zip .
	aws lambda update-function-code --function-name feedbag_find --zip-file fileb://deploy.zip
