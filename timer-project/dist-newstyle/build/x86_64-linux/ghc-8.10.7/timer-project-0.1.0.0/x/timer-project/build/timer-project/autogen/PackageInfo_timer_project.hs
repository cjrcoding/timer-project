{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_timer_project (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "timer_project"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "pomodoro timer"
copyright :: String
copyright = ""
homepage :: String
homepage = ""
