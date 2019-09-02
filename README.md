# ci-build-base docker image

Docker Image based on `circleci/buildpack-deps:trusty-curl` image, which add the following libraries:

- libpq-dev
- secp256k1 Build based on Source Code
- openssl

## How to push a new image to Dockerhub

- Run `$ ./build_and_push version` (requires user to have write access to dockerhub organization)
- Don't forget to change the version on `.circleci/config.yml`

