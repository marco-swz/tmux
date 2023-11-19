final: prev: {
    tmux-config = prev.stdenv.mkDerivation {
        name = "tmux-configured";

        src = ./.;

        installPhase = ''
            mkdir -p $out
            cp -rv . $out/
        '';

        propagatedBuildInputs = [
            prev.tmux
        ];

        #setupHook = ./export.sh;


        #shellHook = ''
            #export TMUX_TEST="tmux -f $out/tmux.conf"
            #alias tmux="tmux -f $out/tmux.conf"
        #'';
    };

    tmux-configured = final.stdenv.mkDerivation {
        name = "testing";

        src = ./.;

        installPhase = ''
            mkdir -p $out
        '';

        buildInputs = [
            (final.writeShellScriptBin "test" "echo ${final.tmux-config}")
        ];

    };
}
