final: prev: {
    tmux = prev.tmux.overrideAttrs (_: {
        enable = true;
        extraConfig = ''
            set -g status-position top
        '';

            #source-file ${./tmux.conf}
        #extraConfig = builtins.readFile ./tmux.conf;
    });
}
