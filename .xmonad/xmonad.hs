import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar defaultConfig
 {
    terminal = "urxvtc"
  }