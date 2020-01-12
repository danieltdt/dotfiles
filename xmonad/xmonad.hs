import qualified XMonad.StackSet as W
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig

main = xmonad =<< statusBar myStatusBar myPP toggleStrutsKey myConfig

-- Command to launch the bar
myStatusBar = "xmobar"

-- Custom pretty-print. Determines what is being written to the bar
myPP = xmobarPP
  { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">"
  }

-- Key binding to toggle the gap for the bar
toggleStrutsKey XConfig
  { XMonad.modMask = modMask
  } = (modMask, xK_b)

-- Custom config
myConfig = desktopConfig
  { terminal = "alacritty"
  , modMask  = mod4Mask
  }
  `additionalKeysP`
  [ ("M-S-l", spawn "/home/daniel/.local/bin/i3lock-with-blur")
  , ("M-p",   spawn "albert show")

  , ("M-<D>",   nextWS)
  , ("M-<U>",   prevWS)
  , ("M-S-<D>", shiftToNext >> nextWS)
  , ("M-S-<U>", shiftToPrev >> prevWS)
  , ("M-<R>",   nextScreen)
  , ("M-<L>",   prevScreen)
  , ("M-S-<R>", shiftNextScreen)
  , ("M-S-<L>", shiftPrevScreen)
  , ("M-z",     toggleWS)
  ]
