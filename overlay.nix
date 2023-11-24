final: prev: {
    tmux-config = prev.stdenv.mkDerivation {
        name = "tmux-config";

        src = ./.;

        installPhase = ''
            mkdir -p $out
            cp -rv . $out/
        '';
    };

    tmux-configured = let 
        tmux-script = final.writeShellScriptBin "tmux" "TERM=xterm-256color ${prev.tmux}/bin/tmux -f ${final.tmux-config}/tmux.conf";
    in final.stdenv.mkDerivation {

        name = "tmux-configured";

        src = ./.;

        installPhase = ''
            mkdir -p $out
        '';

        propagatedBuildInputs = [
            tmux-script
        ];

        buildInputs = [
            prev.tmux
        ];
    };
}
