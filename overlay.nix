final: prev: {
    tmux-configured = prev.stdenv.mkDerivation {
        name = "tmux-configured";

        src = ./.;

        buildInputs = [
            prev.tmux
        ];

        installPhase = ''
            mkdir -p $out
            cp -rv . $out/
        '';

        propagatedBuildInputs = [
            prev.tmux
        ];

        setupHook = ./export.sh;

        #TMUX_TEST = "test";

        shellHook = ''
            export TMUX_TEST="tmux -f $out/tmux.conf"
            alias tmux="tmux -f $out/tmux.conf"
        '';
    };
}
