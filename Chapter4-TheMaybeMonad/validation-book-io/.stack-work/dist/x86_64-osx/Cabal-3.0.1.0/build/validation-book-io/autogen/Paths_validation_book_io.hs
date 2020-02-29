{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_validation_book_io (
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

bindir     = "/Users/nickxusmacbook/Documents/GitHub/HaskellLearning/Chapter4-TheMaybeMonad/validation-book-io/.stack-work/install/x86_64-osx/831cff109dc83272cb21e8533730ef0215e1ddc8efc155dc07e48feb0c8cfc85/8.8.2/bin"
libdir     = "/Users/nickxusmacbook/Documents/GitHub/HaskellLearning/Chapter4-TheMaybeMonad/validation-book-io/.stack-work/install/x86_64-osx/831cff109dc83272cb21e8533730ef0215e1ddc8efc155dc07e48feb0c8cfc85/8.8.2/lib/x86_64-osx-ghc-8.8.2/validation-book-io-0.1.0.0-8Q81zfvLKgD7YXca9sGvX8-validation-book-io"
dynlibdir  = "/Users/nickxusmacbook/Documents/GitHub/HaskellLearning/Chapter4-TheMaybeMonad/validation-book-io/.stack-work/install/x86_64-osx/831cff109dc83272cb21e8533730ef0215e1ddc8efc155dc07e48feb0c8cfc85/8.8.2/lib/x86_64-osx-ghc-8.8.2"
datadir    = "/Users/nickxusmacbook/Documents/GitHub/HaskellLearning/Chapter4-TheMaybeMonad/validation-book-io/.stack-work/install/x86_64-osx/831cff109dc83272cb21e8533730ef0215e1ddc8efc155dc07e48feb0c8cfc85/8.8.2/share/x86_64-osx-ghc-8.8.2/validation-book-io-0.1.0.0"
libexecdir = "/Users/nickxusmacbook/Documents/GitHub/HaskellLearning/Chapter4-TheMaybeMonad/validation-book-io/.stack-work/install/x86_64-osx/831cff109dc83272cb21e8533730ef0215e1ddc8efc155dc07e48feb0c8cfc85/8.8.2/libexec/x86_64-osx-ghc-8.8.2/validation-book-io-0.1.0.0"
sysconfdir = "/Users/nickxusmacbook/Documents/GitHub/HaskellLearning/Chapter4-TheMaybeMonad/validation-book-io/.stack-work/install/x86_64-osx/831cff109dc83272cb21e8533730ef0215e1ddc8efc155dc07e48feb0c8cfc85/8.8.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "validation_book_io_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "validation_book_io_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "validation_book_io_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "validation_book_io_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "validation_book_io_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "validation_book_io_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
