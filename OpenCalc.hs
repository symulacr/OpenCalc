-- OpenCalc.hs - Haskell Example for Plutus (Simplified)

{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}

import PlutusTx.Prelude

add :: Integer -> Integer -> Integer
add a b = a + b

subtract :: Integer -> Integer -> Integer
subtract a b = a - b

-- Implement other mathematical operations as needed