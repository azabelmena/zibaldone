{
  description = "Alec S. Zabel-Mena";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
  };

  outputs = {self, nixpkgs}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system} = {
      zibal = pkgs.mkShell{
        name = "zibal";

        nativeBuildInputs = with pkgs; [
          go
          hugo
          nodejs
        ];
      };
    };
  };

}
