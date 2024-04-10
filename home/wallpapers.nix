{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "rose-pine-wallpapers";
  src = pkgs.fetchgit {
    url = "https://github.com/rose-pine/wallpapers";
    #rev = "main";  # Specify the commit, tag, or branch you want to download.
    sha256 = "1qp/8ACQFvm8nOiO1N08o7s+zsQeZPWopZvG/Ox50ws=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';
}
