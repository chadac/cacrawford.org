---
title: "Boilerplates and templates are bad... except in Nix"
date: 2024-03-30
draft: true
markup: "mmark"
---

Establishing best practices across software projects is a pain in the
ass.

The most common pattern out there for proliferating best practices is
to create a project that follows the golden standard -- a
**boilerplate project** -- which can then be copied into future
repositories to act as a good starting point.

However, the number of tools per language is innumerable and is constantly
evolving. For some languages, the configuration for these tools can
span hundreds or even *thousands* of lines of code, and that trend is
only getting worse. When that code is copied to tens of projects, that
makes for thousands or tens of thousands of lines of code to
maintain. You want your organization to migrate from `black` and
`isort` to `ruff`? Well if you've got 100 Python projects, that's
suddenly infeasible to do for all of them.

The alternative to boilerplates is to centralize your
configurations into a *template*. Your tools are all configured from a
central project instead -- and instead of having 1000-line `Makefile`s
for every project, you just copy a centralized `Makefile` between all
of them.

However, templates are not that great either. While templates reduce
the amount of repeated code, they have their own limitations:

1. Templates obfuscate configurations. The internals of a tool like
   `create-react-app` becomes magic, and that doesn't let developers
   learn or improve.
2. Exceptions are hard to account for. Templates often are great
   starting points, but many projects need additional
   customization. Template authors can anticipate some of these needs,
   but oftentimes it is infeasible to account for all customization
   needs. Some tools, such as `create-react-app`, support
   [ejecting](https://create-react-app.dev/docs/available-scripts#npm-run-eject)
   which explodes the template into a boilerplate, a semi-happy medium
   but creates the issue that the project can no longer stay
   up-to-date with `create-react-app`.
3. They can actually fall behind best practices. As a template
   accumulates more consumers, adopting new standards becomes a real
   problem. If a new build tool or practice breaks 50% of your
   consumers, you can't simply make that the default without
   consulting or planning.

Boilerplates are heavily *customizable*, templates are
*simple*. Unfortunately we can't have both so we have to choose one or
the other, or more commonly, we choose some in-between based on what
is easy (GitLab CI templates, GitHub actions, functional build tools,
etc).

Well, historically we haven't been able to have both. Some tools have
attempted to provide a bridge with varying degrees of success.

<details>
<summary>
Detailed case studies
</summary>

# Case studies


#### GitLab CI

One approach is to make the configuration language functional in order
to suit templating needs. GitLab CI's base syntax for pipelines is
overall very easy to understand and read. For example:

```yaml
my build job:
  image: python:latest
  variables:
    PIP_INDEX_URL: my-custom-pip-index.com/pypi/simple
    S3_DESTINATION: s3://my-artifacts/my-build-job
  pre_script:
    - pip install . --index-url $PIP_INDEX_URL
    - apt install -y awscli
  script:
    - python -m build .
    - twine upload
    - aws s3 sync ./build $S3_DESTINATION
```

What's nice about this configuration is that without even reading the
docs, it's easy to understand: the job runs on the `python:latest`
container, it sets two environment variables (`PIP_INDEX_URL` and
`S3_DESTINATION`) and then it presumably runs the commands specified
in `pre_script` and then `script`.

Declarative syntax is nice because, even when it gets fairly verbose,
it tends to be easy to debug. In this case GitLab's syntax (at least
initially) is so simple that you could easily replicate this on your
own machine.

The problem with this syntax arises when you run into repeated
patterns. Consider, for example, needing to do both your Python build
and the subsequent S3 upload across several projects. In order to do
so, we can provide

```yaml
.python-build:
  image: python:latest
  variables:
    PIP_INDEX_URL: my-custom-pip-index.com/pypi/simple
  pre_script:
    - pip install . --index-url $PIP_INDEX_URL
  script:
    - python -m build .
    - twine upload

.s3-upload:
  variables:
    S3_DESTINATION: s3://my-artifacts/my-build-job
  pre_script:
    - apt install -y awscli
```

#### Gradle: a proper language for functional specification

#### Kubernetes & Helm

On the other hand, Kubernetes has extremely static configurations --
and only through additional tools such as Helm can you add functional
components to your Kubernetes templates. And while Helm is incredibly
powerful and highly customizable... it still isn't perfect. Writing
highly extensible templates is a learned skill, and often requires
constant refactoring based on customer needs. See [Apache
Superset](https://github.com/apache/superset/blob/master/helm/superset/templates/deployment-worker.yaml)
for an example -- which includes a huge amount of logic and
conditionals in order to provide customers with full customizability.

</details>

# Enter Nix

Nix 

## Is Nix the future?

I'm honestly not sure. There are many benefits to Nix's module system
and the Nix philosophy, but it has several major drawbacks that need
to be addressed as well:

* **Documentation is sparse**: There are a few good
  tutorials on modules, but they're primarily focused on modules as a
  contribution to NixOS or Home Manager rather than for standalone
  solutions.
* **Debugging modules is hard**: Modules are *notoriously* hard to
  debug, to the point that even maintainers have issues. Making
  debugging modules easier for template vendors would be key to their
  widespread usage.
* **Nix is an unintuitive language**: Many developers are simply
  unfamiliar with functional programming paradigms. While functional
  programming makes the module system possible, it should be easy for
  developers to learn functional programming while building modules.
* **We need a snowball.** I'm 100% convinced that eventually some tool
  or language will fill this gap -- and when it does, it will become a
  natural part of distributing tools.

The community is clearly aware of this and there have been attempts to
make modules more accessible -- such as
[nickel](https://github.com/tweag/nickel). However, these haven't
really gained much external adoption or traction yet and I still find
their syntax fairly difficult to read (see, for example, [Terraform in
Nickel](https://github.com/tweag/tf-ncl/blob/main/examples/github-simple/main.ncl)).
