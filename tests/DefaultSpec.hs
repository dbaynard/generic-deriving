-- |
-- Module      : DefaultSpec
-- Description : Ensure that deriving via (Default  a)newtype works
-- License     : BSD-3-Clause
--
-- Maintainer  : generics@haskell.org
-- Stability   : experimental
-- Portability : non-portable
--
-- Tests DerivingVia on GHC versions 8.6 and above.
{-# LANGUAGE CPP #-}
#if __GLASGOW_HASKELL__ >= 806
{-# LANGUAGE DerivingVia #-}
#endif

module DefaultSpec where

import Test.Hspec
import Generics.Deriving
import Generics.Deriving.Default ()
import Generics.Deriving.Foldable

spec :: Spec
spec = do
  describe "DerivingVia Default" $ do
    return ()

#if __GLASGOW_HASKELL__ >= 806
newtype TestEq = TestEq Bool
  deriving (GEq) via (Default Bool)
newtype TestEnum = TestEnum Bool
  deriving (GEnum) via (Default Bool)
newtype TestShow = TestShow Bool
  deriving (GShow) via (Default Bool)

newtype TestFoldable a = TestFoldable (Maybe a)
  deriving (GFoldable) via (Default1 Maybe)
newtype TestFunctor a = TestFunctor (Maybe a)
  deriving (GFunctor) via (Default1 Maybe)
#endif
