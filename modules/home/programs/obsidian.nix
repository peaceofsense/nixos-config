{ pkgs, ... }:
let
  gitSyncObsidian = pkgs.writeScriptBin "git-sync-obsidian" ''
    #!/bin/sh

    # Set the vault directory
    VAULT_DIR="$HOME/my-files/vault"

    # Change to the vault directory, exit if it doesn't exist
    cd "$VAULT_DIR" || { echo "Error: Vault directory $VAULT_DIR not found." >&2; exit 1; }

    # Add all changed files to staging area
    git add .

    # Check if there are any changes (staged or unstaged)
    # The 'git diff-index --quiet HEAD' command checks for pending changes
    # in the working tree and index against HEAD. If there are no changes, it exits 0.
    # We want to proceed *only if* there are changes, so we negate its success.
    if git diff-index --quiet HEAD --; then
        echo "No changes detected. Exiting."
        exit 0
    fi

    # Commit changes. The '|| true' allows the script to continue if commit fails because
    # there truly were no changes despite the check (e.g., race condition).
    # However, since we now have a more robust check, this might not be strictly necessary
    # but doesn't hurt. A better approach is to ensure the prior check is perfect.
    # Reverted to original error handling for clarity: fail if commit truly fails.
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')" || { echo "Error: Git commit failed." >&2; exit 1; }

    # Pull changes with rebase. Exit if pull fails.
    git pull --rebase origin main || { echo "Error: Git pull --rebase failed." >&2; exit 1; }

    # Push changes to origin. Exit if push fails.
    git push origin main || { echo "Error: Git push failed." >&2; exit 1; }

    echo "Obsidian vault synced successfully."
  '';
in {
  home.packages = [ gitSyncObsidian ];

  # Define the Systemd User Service
  systemd.user.services.git-sync-obsidian = {
    Unit = {
      Description = "Sync Obsidian Vault with Github";
    };
    Service = {
      ExecStart = "${gitSyncObsidian}/bin/git-sync-obsidian";
      Type = "oneshot";
      RemainAfterExit = false;
    };
  };

  # Define the Systemd User Timer
  systemd.user.timers.git-sync-obsidian = {
    Unit = {
      Description = "Run Git Sync for Obsidian Vault";
    };
    Timer = {
      OnCalendar = "*:0/15";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}