module Deasync (deasync, deasyncAff) where

import Effect (Effect)
import Control.Promise (fromAff, Promise)
import Effect.Aff (Aff)
import Prelude


foreign import deasync :: forall a. (Effect (Promise a)) -> Effect a

deasyncAff :: forall a. Aff a -> Effect a
deasyncAff = deasync <<< fromAff
