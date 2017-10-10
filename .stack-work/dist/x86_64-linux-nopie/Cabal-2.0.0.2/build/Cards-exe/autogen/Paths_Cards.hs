{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Cards (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/lokelow/Projects/Cards/.stack-work/install/x86_64-linux-nopie/nightly-2017-10-09/8.2.1/bin"
libdir     = "/home/lokelow/Projects/Cards/.stack-work/install/x86_64-linux-nopie/nightly-2017-10-09/8.2.1/lib/x86_64-linux-ghc-8.2.1/Cards-0.1.0.0-5VH3DY3xLp571aXYyXyknm-Cards-exe"
dynlibdir  = "/home/lokelow/Projects/Cards/.stack-work/install/x86_64-linux-nopie/nightly-2017-10-09/8.2.1/lib/x86_64-linux-ghc-8.2.1"
datadir    = "/home/lokelow/Projects/Cards/.stack-work/install/x86_64-linux-nopie/nightly-2017-10-09/8.2.1/share/x86_64-linux-ghc-8.2.1/Cards-0.1.0.0"
libexecdir = "/home/lokelow/Projects/Cards/.stack-work/install/x86_64-linux-nopie/nightly-2017-10-09/8.2.1/libexec/x86_64-linux-ghc-8.2.1/Cards-0.1.0.0"
sysconfdir = "/home/lokelow/Projects/Cards/.stack-work/install/x86_64-linux-nopie/nightly-2017-10-09/8.2.1/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Cards_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Cards_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Cards_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Cards_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Cards_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Cards_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
