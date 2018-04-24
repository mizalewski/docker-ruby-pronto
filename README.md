# Pronto Docker image

Docker image for CodeBuild to run pronto to check code quality. By default image has installed below runners:
- brakeman
- fasterer
- flay
- poper
- rails_best_practices
- reek
- rubocop
- scss
- slim
- yamllint

## How to use it?

Build Docker image, push to ECR (EC2 Container Registry) and select it in CodeBuild project configuration.
