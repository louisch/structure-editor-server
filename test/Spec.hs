{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework
import Data.List

prop_idempotent :: [Integer] -> Bool
prop_idempotent xs = sort (sort xs) == sort xs

main :: IO ()
main = htfMain htf_thisModulesTests
