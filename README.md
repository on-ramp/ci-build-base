# Haskell Stack building images

There're 3 Docker Images here:

 - `coinweb/base-stack`
 - `coinweb/ci-build-base`
 - `coinweb/stacktastic-build`

`ci-build-base` is `FROM` the `base-stack` and is used on CI.

`stacktastic-build` is a rewritten version of `base-stack` aiming at two goals:
unprivileged (rootless) build container, and fully static output binaries
("-tastic" is anagram of "static"). The latter goal seems not achievable with
GHC 8.6.5 (released Apr 24 2019), and is awaiting GHC upgrade.

All images are tagged with Stack Resolver version; e.g. `coinweb/stacktastic-build:lts-16.19` would be configured with [LTS Haskell 16.19][].

[LTS Haskell 16.19]: https://www.stackage.org/lts-16.19

In addition to Stack, the images have native compilation dependencies:

 - libpq-dev
 - openssl
 - pkg-config
 - secp256k1

## How to use

- Run `./build_and_push version` (requires user to have write access to dockerhub organization)
- Don't forget to change the version on `.circleci/config.yml`

