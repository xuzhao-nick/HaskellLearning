{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_validation_book (
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

bindir     = "/Users/nickxu/Documents/github/HaskellLearning/Chapter4-TheMaybeMonad/validation-book/.stack-work/install/x86_64-osx/7ea68ced89361af2acad58370196b696d0d9acfae763aa7b0cbdb83e5ca1c6e1/8.8.2/bin"
libdir     = "/Users/nickxu/Documents/github/HaskellLearning/Chapter4-TheMaybeMonad/validation-book/.stack-work/install/x86_64-osx/7ea68ced89361af2acad58370196b696d0d9acfae763aa7b0cbdb83e5ca1c6e1/8.8.2/lib/x86_64-osx-ghc-8.8.2/validation-book-0.1.0.0-CiWtOt4tIoC16a6QTteMZ6-validation-book"
dynlibdir  = "/Users/nickxu/Documents/github/HaskellLearning/Chapter4-TheMaybeMonad/validation-book/.stack-work/install/x86_64-osx/7ea68ced89361af2acad58370196b696d0d9acfae763aa7b0cbdb83e5ca1c6e1/8.8.2/lib/x86_64-osx-ghc-8.8.2"
datadir    = "/Users/nickxu/Documents/github/HaskellLearning/Chapter4-TheMaybeMonad/validation-book/.stack-work/install/x86_64-osx/7ea68ced89361af2acad58370196b696d0d9acfae763aa7b0cbdb83e5ca1c6e1/8.8.2/share/x86_64-osx-ghc-8.8.2/validation-book-0.1.0.0"
libexecdir = "/Users/nickxu/Documents/github/HaskellLearning/Chapter4-TheMaybeMonad/validation-book/.stack-work/install/x86_64-osx/7ea68ced89361af2acad58370196b696d0d9acfae763aa7b0cbdb83e5ca1c6e1/8.8.2/libexec/x86_64-osx-ghc-8.8.2/validation-book-0.1.0.0"
sysconfdir = "/Users/nickxu/Documents/github/HaskellLearning/Chapter4-TheMaybeMonad/validation-book/.stack-work/install/x86_64-osx/7ea68ced89361af2acad58370196b696d0d9acfae763aa7b0cbdb83e5ca1c6e1/8.8.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "validation_book_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "validation_book_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "validation_book_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "validation_book_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "validation_book_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "validation_book_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
