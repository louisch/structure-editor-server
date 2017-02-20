module Compile
    ( modulePrint
    , typePrint
    ) where

import Language.Haskell.Syntax
import Language.Haskell.Pretty

dummyLoc :: SrcLoc
dummyLoc = SrcLoc "" 0 0

lineLoc :: Int -> SrcLoc
lineLoc n = SrcLoc "" n 0

myDecl :: HsDecl
myDecl = HsTypeSig dummyLoc [HsIdent "func"] (HsQualType [] (HsTyCon (tuple_tycon_name 3)))

myModule :: String -> HsModule
myModule name = HsModule dummyLoc (Module name) (Just [HsEVar (UnQual (HsIdent "func"))]) [] [myDecl]

myType :: HsType
myType = HsTyFun (HsTyVar (HsSymbol "Etc")) (HsTyVar (HsIdent "x"))

modulePrint :: String
modulePrint = prettyPrint (myModule "MyModule")

typePrint :: String
typePrint = prettyPrint myDecl

-- readNamesFile' :: ExpG (IO String)
-- readNamesFile' = readFile' <>$ expr "names"
--
-- myModule :: ModuleG
-- myModule = do
--   d <- addDecl (Ident "main") $ applyE2 bind' readNamesFile' putStrLn'
--   return $ Just [exportFun d]
