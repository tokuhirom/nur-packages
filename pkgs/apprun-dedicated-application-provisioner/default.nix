{ lib, mkGitHubReleaseBinary }:

mkGitHubReleaseBinary {
  pname = "apprun-dedicated-application-provisioner";
  version = "0.0.26";
  repo = "tokuhirom/apprun-dedicated-application-provisioner";
  sha256s = {
    "aarch64-darwin" = "0vlxf4hqnjnlzzn78165hzl393yym28dlnfh91yydagb513wbpv0";
    "x86_64-darwin"  = "0icgh55r8pba8gkqb07dkv1frapd1qzfwrw02nfs1y5phn81c13f";
    "aarch64-linux"  = "0q1696w8pwc1l8q7vin24cr7lpccdyyqyyiribrnm7c2ivf3nsc4";
    "x86_64-linux"   = "129labkwq4ljkr7fy8cjbnhp6xnxyq6ykkv3k6ammbk9r2cfip2m";
  };
}
