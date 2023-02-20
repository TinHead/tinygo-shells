{
  description = "TinyGo shell";
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable"; 
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          devShells.pico = import ./pico-shell.nix { inherit pkgs; };
        }
      );
}
