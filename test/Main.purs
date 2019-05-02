module Test.Main where

import Prelude

import Control.Promise (fromAff)
import Data.Either (either)
import Deasync (deasync, deasyncAff)
import Effect (Effect)
import Effect.Aff (Aff, attempt, error, message, throwError)
import Effect.Class (liftEffect)
import Test.Assert as Assert

go :: Aff Int
go = pure 1

fail :: Aff Int
fail = throwError (error ":(")

main :: Effect Unit
main = do
  v1 <- deasyncAff go
  Assert.assert (v1 == 1)
  v2 <- deasync $ fromAff go
  Assert.assert (v2 == 1)
  v3 <- deasyncAff $ attempt fail
  liftEffect $ Assert.assertEqual' "Error message is correct"
    { expected: ":("
    , actual: (either message (const "") v3)
    }
