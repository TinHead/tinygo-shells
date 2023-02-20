
{ pkgs ? import <unstable> {} }:
with pkgs;
mkShell {
  buildInputs = [
    tinygo go gopls delve
  ];

  shellHook = ''
     export GOROOT=$(tinygo info pico|grep GOROOT|awk '{print $3}')
     export GOFLAGS=-tags=$(tinygo info pico|grep "build tags"|awk -F" {1,}" '{for(i=3;i<NF;i++) printf $i","; print $NF}')
     export GOPATH=/home/$(whoami)/go:${tinygo}/share/tinygo 
  '';
}