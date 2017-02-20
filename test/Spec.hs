{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework
import Data.List

prop_idempotent :: [Integer] -> Bool
prop_idempotent xs = sort (sort xs) == sort xs


testModuleStr :: String
testModuleStr = ""


prop_parse_unparse :: Bool
prop_parse_unparse = unparse (parseModule testModuleStr)


main :: IO ()
main = htfMain htf_thisModulesTests
