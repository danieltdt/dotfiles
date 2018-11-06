import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- NOTES: 0.10 works much better than 0.9, unfortunately distros mostly package 0.9 atm
-- xmobar and fullscreen flash vids (youtube): http://code.google.com/p/xmobar/issues/detail?id=41

-- TODO: would still like fullscreen flash vids to not crop and leave xmobar drawn
-- TODO: remove the red border when doing fullscreen? tried adding 'smartBorders' to the layoutHook but that didn't work
-- TODO: hook in TopicSpaces, start specific apps on specific workspaces

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/daniel/.config/xmonad/xmobarrc"

  xmonad def
            { terminal = "hyper"
              , modMask = mod4Mask
              , borderWidth = 3
              , manageHook = manageDocks <+> manageHook def
              , layoutHook = avoidStruts $ layoutHook def
              , logHook = dynamicLogWithPP $ xmobarPP
                                                     { ppOutput = hPutStrLn xmproc
                                                     , ppTitle = xmobarColor "green" "" . shorten 50
                                                     }
            }
