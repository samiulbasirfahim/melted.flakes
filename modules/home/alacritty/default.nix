{
  programs.alacritty = {
    enable = true;
  };
  xdg.configFile."alacritty/alacritty.yml".text = ''
    import:
      - ~/.cache/wal/colors-alacritty.yml

    env:
      TERM: xterm-256color

    window:
      padding:
        x: 6
        y: 6
      opacity: 1.0
      title: Alacritty
    font:
      normal:
        family: JetbrainsMono Nerd Font
        style: Regular
      bold:
        family: JetbrainsMono Nerd Font
        style: Bold
      italic:
        family: JetbrainsMono Nerd Font
        style: Italic
      bold_italic:
        family: JetbrainsMono Nerd Font
        style: Bold Italic

      # Point size
      size: 12.0
      offset:
        x: 0
        y: 1

    draw_bold_text_with_bright_colors: true

    key_bindings:
      - { key: V,         mods: Control|Shift, action: Paste                       }
      - { key: C,         mods: Control|Shift, action: Copy                        }
      - { key: Insert,    mods: Shift,         action: PasteSelection              }
      - { key: Key0,      mods: Control,       action: ResetFontSize               }
      - { key: Equals,    mods: Control,       action: IncreaseFontSize            }
      - { key: Plus,      mods: Control,       action: IncreaseFontSize            }
      - { key: Minus,     mods: Control,       action: DecreaseFontSize            }
      - { key: F11,       mods: None,          action: ToggleFullscreen            }
      - { key: Paste,     mods: None,          action: Paste                       }
      - { key: Copy,      mods: None,          action: Copy                        }
      - { key: L,         mods: Control,       action: ClearLogNotice              }
      - { key: L,         mods: Control,       chars: "\x0c"                       }
      - { key: PageUp,    mods: None,          action: ScrollPageUp,   mode: ~Alt  }
      - { key: PageDown,  mods: None,          action: ScrollPageDown, mode: ~Alt  }
      - { key: Home,      mods: Shift,         action: ScrollToTop,    mode: ~Alt  }
      - { key: End,       mods: Shift,         action: ScrollToBottom, mode: ~Alt  }

  '';
}
