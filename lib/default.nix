{ pkgs }:

with pkgs.lib; {
  # Helper function to install binaries from GitHub Releases
  mkGitHubReleaseBinary = { pname, version, repo, sha256s, binName ? pname }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      platformInfo = {
        "aarch64-darwin" = { os = "darwin"; arch = "arm64"; };
        "x86_64-darwin"  = { os = "darwin"; arch = "amd64"; };
        "aarch64-linux"  = { os = "linux";  arch = "arm64"; };
        "x86_64-linux"   = { os = "linux";  arch = "amd64"; };
      }.${system} or (throw "Unsupported system: ${system}");
    in
    pkgs.stdenv.mkDerivation {
      inherit pname version;

      src = pkgs.fetchurl {
        url = "https://github.com/${repo}/releases/download/v${version}/${pname}_${version}_${platformInfo.os}_${platformInfo.arch}.tar.gz";
        sha256 = sha256s.${system} or (throw "No sha256 for system: ${system}");
      };

      sourceRoot = ".";
      nativeBuildInputs = [ pkgs.gnutar ];

      unpackPhase = ''
        tar xzf $src
      '';

      installPhase = ''
        mkdir -p $out/bin
        cp ${binName} $out/bin/
      '';

      meta = with pkgs.lib; {
        homepage = "https://github.com/${repo}";
        platforms = platforms.unix;
      };
    };
}
