# AWS Lambda Ruby 3.4 runtime
FROM public.ecr.aws/lambda/ruby:3.4

# Copy Gemfile first for better Docker layer caching
COPY Gemfile Gemfile.lock ${LAMBDA_TASK_ROOT}/

# Install dependencies
WORKDIR ${LAMBDA_TASK_ROOT}
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install

# Copy function code
COPY lambda_feedbag.rb ${LAMBDA_TASK_ROOT}/

# Set the handler
CMD ["lambda_feedbag.find"]
