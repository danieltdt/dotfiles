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
  { ppCurrent       = xmobarColor "#5294e2" "" . wrap "<" ">"
  , ppVisible       = xmobarColor "#c4c4c4" "" . wrap "(" ")"
  , ppTitle         = xmobarColor "#ffffff" "" . shorten 40
  , ppTitleSanitize = xmobarStrip . dzenEscape
  }

-- Key binding to toggle the gap for the bar
toggleStrutsKey XConfig
  { XMonad.modMask = modMask
  } = (modMask, xK_b)

myWorkspaces = [ "1:web", "2:code", "3:bash" ] ++ map show [ 4..9 ]

-- Custom config
myConfig = desktopConfig
  { terminal           = "alacritty"
  , modMask            = mod4Mask
  , workspaces         = myWorkspaces
  , focusedBorderColor = "#5294e2"
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
