{ pkgs, stdenv, runtimeShell }:
stdenv.mkDerivation rec {
    name = "tmuxc";

    src = ./.;

    buildInputs = [ pkgs.tmux pkgs.makeWrapper ];

    binScript = ''
        #!${runtimeShell}
        TERM=xterm-256color ${pkgs.tmux}/bin/tmux -f ${placeholder "out"}/tmux.conf
    '';

    passAsFile = [ "binScript" ];

    installPhase = ''
        mkdir -p $out/bin
        cp -r ./. $out/
        cp $binScriptPath $out/bin/tmuxc
        chmod +x $out/bin/tmuxc
    '';
}
