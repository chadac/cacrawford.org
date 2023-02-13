# cacrawford.org

Source code for https://cacrawford.org. Written in Hugo, deployed to
Amazon S3 via Bitbucket Pipelines.

The website itself is hosted on Amazon S3 and served via CloudFront to
speed up load times.

## TODO

* Swap to a new theme. My current one is a bit information-absent IMO
* Nixify this! Everything must be Nix.
* Automate infrastructure deployment. Previously I set up Route53, S3
  and CloudFront manually.
