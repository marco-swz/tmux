final: prev: {
    tmux = prev.tmux.overrideAttrs (_: {
        #extraConfig = ''
        #    source-file ${./tmux.conf}
        #'';
        extraConfig = builtins.readFile ./tmux.conf;
    });
}
