---
title: "Nix module trick: Re-evaluating yourself"
date: 2024-03-30
draft: false
markup: "mmark"
---

This is a cool trick for those playing around with Nix's module
system. While developing
[nix-config-modules](https://github.com/chadac/nix-config-modules/), I
ran into a semi-unique issue: In the module system I defined a set of
*hosts* and a separate, general set of *apps*, and hosts could define
which *apps* they could import.

To generate this subset of `app` configurations, I wanted to be able
to re-evaluate all of my `app` modules with a host argument. In other
words, I wanted to be able to write modules like:

```nix
{ host, ... }:
{
  app.emacs = {
    enable = host.kind == "nixos";
  };
}
```

And then essentially I would call `lib.evalModules` on the apps
modules with the `host` argument substituted with each host I had
configured.

What I needed was, in my module system I needed to grab all the
modules that defined my modules. Fortunately Nix makes this easy:
every module gets a `moduleType` argument that includes the definition
of all modules. So if you need to reevaluate all of your modules with
a special additional configuration, all you need to do is:

```nix
{ lib, moduleType, ... }:
# < ... >
lib.evalModules {
  modules = moduleType.getSubModules ++ [
    { _module.args.host = myHost; }
  ];
};
```

Of course you'd need to be extremely careful as there's a huge risk of
infinite recursion here, but it can be pretty handy.
