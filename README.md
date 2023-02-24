# cacrawford.org

Source code for https://cacrawford.org. Written in Hugo, deployed to
Amazon S3 via Bitbucket Pipelines.

The website itself is hosted on Amazon S3 and served via CloudFront to
speed up load times.

The Hugo template is built using [Nix](https://nixos.org/), ensuring
that builds and deployments are reproducible.

## Usage

To build the website, run:

    nix build

For running an interactive editable session, run:

    nix develop

Then you can run

    hugo serve

## TODO

* Automate infrastructure deployment. Previously I set up Route53, S3
  and CloudFront manually.
