--xmonad import
import XMonad
import XMonad.Hooks.ManageDocks
--para las venanas sticky
import XMonad.Actions.CopyWindow
-- StackSet
import qualified XMonad.StackSet as W

import Control.Monad (liftM2)
import qualified Data.Map as M
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops

main :: IO ()
main = xmonad conf

conf = ewmh $ defaultConfig
	{ modMask = myModMask 
	, terminal = myTerminal
    , workspaces = ["1:web", "2:consola", "3:gvim", "4:pdfs", "5", "6", "7", "8:float", "9:float"]
    , manageHook = myManageHook <+> manageHook defaultConfig
    , keys = \c -> myKeys c `M.union` keys defaultConfig c
    , focusFollowsMouse = False
    , startupHook = setWMName "LG3D"
    , handleEventHook = fullscreenEventHook     -- Para que funcione el fullscreen en firefox
	}


myTerminal = "termite"

-- Usamos tecla windows en vez de alt
myModMask = mod4Mask

-- Hooks
myManageHook = composeAll
        [ className =? "Iceweasel" --> doShift "1:web"
        , className =? "Firefox" --> doShift "1:web"
        , className =? "Termite" --> doShift "2:consola"
        , className =? "Gvim" --> doShift "3:gvim"
        , className =? "Apvlv" --> doShift "4:pdfs"
        , className =? "Pidgin" --> doShift "9:float"
        , className =? "Omnetpp" --> doShift "8:float"
        , manageDocks
        ]
        --where viewShift = doF . liftM2 (.) W.greedyView W.shift

-- Key Maps
-- Lista de teclas http://hackage.haskell.org/packages/archive/X11/latest/doc/html/Graphics-X11-Types.html
-- Con xev podemos obtener el código para saber que tecla corresponde a cual
myKeys (XConfig {modMask = modm}) = M.fromList $
                                    [ ((modm , xK_f), spawn "firefox") --Mod-F abre Firefox
                                    , ((modm , xK_v), spawn "gvim") --Mod-V abre gvim
                                    --Stikys windows
                                    , ((modm, xK_s ), sequence_ $ [windows $ copy i | i <- XMonad.workspaces conf]) --stiky
                                    , ((modm .|. shiftMask, xK_s ), windows $ kill8 ) --elimina el stiky
                                    --Control de MPD
                                    , ((modm , xK_plus), spawn "mpc volume +5") --Sube el volumen
                                    , ((modm , xK_minus), spawn "mpc volume -5") --Baja el volumen
                                    , ((modm , xK_p), spawn "mpc --no-status toggle") --Pausa 
                                    , ((modm , xK_less), spawn "mpc --no-status prev") -- < Cancion anterior
                                    , ((modm , xK_z), spawn "mpc --no-status next") -- z Cancion siguiente
                                    , ((modm , 0x1008ff13), spawn "mpc volume +5") --Sube el volumen
                                    , ((modm , 0x1008ff11), spawn "mpc volume -5") --Baja el volumen
                                    ]

-- Elimina las windows que se pusieron con el stiky
kill8 ss 
        | Just w <- W.peek ss = (W.insertUp w) $ W.delete w ss
        | otherwise = ss
