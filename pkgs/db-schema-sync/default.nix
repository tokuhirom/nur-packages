{ lib, mkGitHubReleaseBinary }:

mkGitHubReleaseBinary {
  pname = "db-schema-sync";
  version = "0.0.8";
  repo = "tokuhirom/db-schema-sync";
  sha256s = {
    "aarch64-darwin" = "1kdb52vkz9q0sdzinsz1m561gjkiwafk9smq5xs30di3ybqqbqp4";
    "x86_64-darwin"  = "12ssgs7wjyr6l991gj9p7ra0x5f5jgrn7bbxph12i9jpgi6vw9cm";
    "aarch64-linux"  = "1jykjfbdx807850nbfkjl73shi5ydnnnzlbybb3qd11i89b1zs04";
    "x86_64-linux"   = "0jwk79f4y4n5q6fjrxp7l7vzzr7zp8wfgv89mrxvyb0yk5rz8p19";
  };
}
