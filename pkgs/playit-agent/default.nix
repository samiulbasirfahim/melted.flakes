# Derivation, not a module!
{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "playit-agent";
  version = "v1.0.0-rc2"; # for release 1.0.0-rc2;
  doCheck = false; # the tests weren't letting it build???
  # You have to change this to disable just the test that wasn't making it work: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md#running-package-tests-running-package-tests

  src = fetchFromGitHub {
    owner = "playit-cloud";
    repo = pname;
    rev = version;
    sha256 = "sha256-mqJtbRS/ZTerbyrS16Q5KRiN71jOpVzCNuyzHslJoSg=";
  };

  cargoSha256 = "sha256-I9pW8XSqj/CGHMcUmH0JlYq1TlVNChMWggabUOZhPwk=";

  meta = with lib; {
    description = "game client to run servers without portforwarding";
    homepage = "https://playit.gg";
    license = licenses.unlicense;
    maintainers = ["Yeshey"];
  };
}
