module Lib
    ( modulePrint
    ) where

import Language.Haskell.Syntax
import Language.Haskell.Pretty

dummyLoc :: SrcLoc
dummyLoc = SrcLoc "" 0 0

myModule :: String -> HsModule
myModule name = HsModule dummyLoc (Module name) Nothing [] []

modulePrint :: String
modulePrint = prettyPrint $ myModule "Test"

-- readNamesFile' :: ExpG (IO String)
-- readNamesFile' = readFile' <>$ expr "names"
--
-- myModule :: ModuleG
-- myModule = do
--   d <- addDecl (Ident "main") $ applyE2 bind' readNamesFile' putStrLn'
--   return $ Just [exportFun d]
