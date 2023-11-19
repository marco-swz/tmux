final: prev: {
    tmux-config = prev.stdenv.mkDerivation {
        name = "tmux-configured";

        src = ./.;

        installPhase = ''
            mkdir -p $out
            cp -rv . $out/
        '';
    };

    tmux-configured = let 

        tmux-script = final.writeShellScriptBin "tmux" "${prev.tmux}/bin/tmux -f ${final.tmux-config}/tmux.conf";

    in final.stdenv.mkDerivation {

        name = "ftest";

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
