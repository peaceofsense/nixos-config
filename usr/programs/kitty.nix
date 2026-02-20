{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono NF";
      # size = 12.0;
    };
    extraConfig = ''
      # Font variants
      italic_font      auto
      bold_font        auto
      bold_italic_font auto

      # Window & background opacity (not color!)
      background_opacity    0.95

      # Cursor
      cursor_shape          beam
      cursor_blink_interval 0.5
      cursor_stop_blinking_after 15.0

      # Selection (no color, let theme handle it)
      # selection_foreground
      # selection_background

      # Scrollback & mouse
      scrollback_lines      2000
      scrollback_pager      less +G -R
      wheel_scroll_multiplier 5.0
      click_interval        0.5
      select_by_word_characters :@-./_~?&=%+#
      mouse_hide_wait       0.0

      # Window size/layout
      enabled_layouts       *
      remember_window_size  no
      initial_window_width  800
      initial_window_height 480

      # Performance
      repaint_delay         10
      input_delay           3

      # Bells
      visual_bell_duration  0.0
      enable_audio_bell     no

      # URL handling
      open_url_modifiers    ctrl+shift
      open_url_with         default

      # TERM
      term                  xterm-kitty

      # Borders & margins
      window_border_width   0
      window_margin_width   15

      # Tab bar appearance (NO color values!)
      tab_bar_edge              bottom
      tab_bar_margin_height     0 7.5
      tab_bar_style             powerline
      tab_bar_align             left
      tab_title_max_length      27

      tab_title_template        "{index}"
      active_tab_title_template "󰄛"
      active_tab_font_style     bold

      # Key mappings
      map super+v             paste_from_clipboard
      map ctrl+shift+s        paste_from_selection
      map super+c             copy_to_clipboard
      map shift+insert        paste_from_selection

      map ctrl+shift+up        scroll_line_up
      map ctrl+shift+down      scroll_line_down
      map ctrl+shift+k         scroll_line_up
      map ctrl+shift+j         scroll_line_down
      map ctrl+shift+page_up   scroll_page_up
      map ctrl+shift+page_down scroll_page_down
      map ctrl+shift+home      scroll_home
      map ctrl+shift+end       scroll_end
      map ctrl+shift+h         show_scrollback

      map ctrl+shift+enter    new_window
      map ctrl+shift+]        next_window
      map ctrl+shift+[        previous_window
      map ctrl+shift+f        move_window_forward
      map ctrl+shift+b        move_window_backward
      map ctrl+shift+\`       move_window_to_top
      map ctrl+shift+1        first_window
      map ctrl+shift+2        second_window
      map ctrl+shift+3        third_window
      map ctrl+shift+4        fourth_window
      map ctrl+shift+5        fifth_window
      map ctrl+shift+6        sixth_window
      map ctrl+shift+7        seventh_window
      map ctrl+shift+8        eighth_window
      map ctrl+shift+9        ninth_window
      map ctrl+shift+0        tenth_window

      map ctrl+shift+right    next_tab
      map ctrl+shift+left     previous_tab
      map ctrl+shift+t        new_tab
      map ctrl+shift+q        close_tab
      map ctrl+shift+l        next_layout
      map ctrl+shift+.        move_tab_forward
      map ctrl+shift+,        move_tab_backward

      map ctrl+shift+up      increase_font_size
      map ctrl+shift+down    decrease_font_size
      map ctrl+shift+backspace restore_font_size

      hide_window_decorations yes
      macos_option_as_alt no
      remember_window_size yes
      confirm_os_window_close 0

      allow_remote_control yes
    '';
  };

  # Optionally, manage included files as well
  xdg.configFile."kitty/theme.conf".text = ''
    # Put your theme config here if needed
  '';
  xdg.configFile."kitty/current-theme.conf".text = ''
    # Put your current theme config here if needed
  '';
}
