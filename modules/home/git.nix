{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;

        settings = {
            user.email = "72244031+peaceofsense@users.noreply.github.com";
            user.name = "peaceofsense";
            "filter \"lfs\"".clean = "git-lfs clean -- %f";
            "filter \"lfs\"".smudge = "git-lfs smudge -- %f";
            "filter \"lfs\"".process = "git-lfs filter-process";
            "filter \"lfs\"".required = "true";
        };
    };
}
