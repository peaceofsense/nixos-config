{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Browsers
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/chrome" = "zen-beta.desktop";
      "application/x-extension-htm" = "zen-beta.desktop";
      "application/x-extension-html" = "zen-beta.desktop";
      "application/x-extension-shtml" = "zen-beta.desktop";
      "application/xhtml+xml" = "zen-beta.desktop";
      "application/x-extension-xhtml" = "zen-beta.desktop";
      "application/x-extension-xht" = "zen-beta.desktop";

      # Text
      "text/plain" = "zeditor.desktop";
      "text/markdown" = "zeditor.desktop";
      "text/json" = "zeditor.desktop";
      "text/calendar" = "userapp-Thunderbird-WP7AU2.desktop";

      # PDFs
      "application/pdf"="org.gnome.Evince.desktop";

      # Images (GNOME image viewer)
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/tiff" = "fiji.desktop";

      # GIFs & videos
      "image/gif" = "vlc.desktop";
      "video/mp4" = "vlc.desktop";
      "video/x-matroska" = "vlc.desktop";
      "video/webm" = "vlc.desktop";
      "video/ogg" = "vlc.desktop";
      
      # Misc
      "application/x-partial-download" = "vlc.desktop";
    };
  };
}
