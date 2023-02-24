{ pkgs, lib, stdenv, fetchFromGitHub, hugo, runCommand }:
let
  hugoTheme = fetchFromGitHub {
    owner = "panr";
    repo = "hugo-theme-terminal";
    rev = "v3.1.2";
    sha256 = "sha256-EKCAirhCMJ6FW5oj3pEfkq2XKn4N78P6+TLFrtw1HPM=";
  };

  hugoThemes = runCommand "cacrawford.org-hugo-themes" {} ''
    mkdir -p $out
    ln -s ${hugoTheme} $out/hugo-theme-terminal
  '';
in
stdenv.mkDerivation {
  name = "cacrawford.org";

  src = lib.cleanSource ./.;

  buildInputs = [ hugo ];

  buildPhase = ''
    ${hugo}/bin/hugo --destination $out/public
  '';

  # Point the themes directory at our themes derivation.
  HUGO_THEMESDIR = "${hugoThemes}";
}
