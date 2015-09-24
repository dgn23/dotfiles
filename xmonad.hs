import System.IO
import System.Exit
import XMonad
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal::[Char]    
myTerminal = "/run/current-system/sw/bin/konsole"

-- TODO: Define myScreensaver
-- TODO: Define myScreenshot(s) (select and full)

-- Note: I lifted myLauncher from vic fryzel's xmonad.hs whole cloth; seems fine, but keep
-- an eye on that"iso8859" and perhaps change to UTF8.

myLauncher::[Char]
myLauncher = "$(yeganesh -x -- -fn '-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*' -nb '#000000' -nf '#FFFFFF' -sb '#7C7C7C' -sf '#CEFFAC')"

mySpaces = ["1:term","2:web","3:emacs","4:media"] ++ map show [6..9]
           
myManageHook = composeAll
               [ className =? "Chromium" --> doShift "2:web"
               , className =? "Google-Chrome" --> doShift "2:web"
               , resource  =? "desktop_window" --> doIgnore
               , title     =? "emacs"  --> doShift "3:emacs"
               , title     =? "emacsclient" --> doShift "3:emacs"
               , className =? "Inkscape"    --> doShift "4:media"
               , className =? "stalonetray" --> doIgnore
               , isFullscreen --> (doF W.focusDown <+> doFullFloat)]
                 
  
myLayout = avoidStruts (ThreeColMid 1 (3/100) (1/2) ||| Tall 1 (3/100) (1/2) |||
                         Mirror (Tall 1 (3/100) (1/2)) ||| tabbed shrinkText tabConfig |||
                         Full ||| spiral (6/7)) 
    
myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "#ffb6b0"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000"
}

-- Color of current window title in xmobar.
xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

-- Width of the window border in pixels.
myBorderWidth = 1

myModMask = mod4Mask

main::IO()
main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  xmonad $ defaults {
      logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppSep = "   "
      }
      , manageHook = manageDocks <+> myManageHook
  }


defaults = defaultConfig {
    -- simple stuff
    terminal           = myTerminal,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = mySpaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- hooks, layouts
    layoutHook         = myLayout,
    manageHook         = myManageHook
}

-- Notes for xmonad based on vic fryzel's [[http://github.com/vicfryzel/xmonad-config]]
-- Structure:
-- >| import ...
-- >| defined functions, e.g., myTerminal = "/path/to/binary"
-- >>|(*) mySpaces = ["1:term","2:web","3:emacs","4:media"] ++ map show [6..9]
-- >| layout definitions
-- >>| (*) myLayout

-- main :: IO()
-- main = do
--  xmproc <- spawnPipe "xmobar"
--  xmonad $ defaultConfig {
--   modMask    = mod4Mask,
--   terminal   = "urxvt"}
--    manageHook = manageDocks <+> manageHook defaultConfig,
--    layoutHook = avoidStruts  $  manageHook defaultConfig,
--  logHook      = dynamicLogWithPP $ xmobarPP
--               { ppOutput = hPutStrLn xmproc,
--                 ppTitle  = xmobarColor "green" "" . shorten 50
--               }







        
 

