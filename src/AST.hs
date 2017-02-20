{-# LANGUAGE DeriveGeneric #-}

module AST
  (testFunc,
   testTree,
   Tree(..),
   encode)
  where

import Data.Aeson
import Data.Aeson.Types as Aeson
import GHC.Generics


-- AST
--
-- tree := decl*
-- decl := name anonfunc
-- anonfunc := arg* exp
-- exp := anonfunc name | num | anonfunc
-- arg := name
-- name := [a-z]*


data Tree = Tree [Declaration] deriving (Generic, Show)

data Declaration = Declaration Name AnonFunc deriving (Generic, Show)

data AnonFunc = AnonFunc ArgSpec Exp deriving (Generic, Show)

type ArgSpec = [Name]

data Exp = ExpApply AnonFunc [Arg]
         | ExpInt Int
         | ExpFunc AnonFunc
         deriving (Generic, Show)

type Arg = Exp

type Name = String

-- Instances automatically provided by LANGUAGE pragma/Generic instance
instance ToJSON Tree where
  toEncoding = genericToEncoding defaultOptions
instance FromJSON Tree

instance ToJSON Declaration where
  toEncoding = genericToEncoding defaultOptions
instance FromJSON Declaration

instance ToJSON AnonFunc where
  toEncoding = genericToEncoding defaultOptions
instance FromJSON AnonFunc

instance ToJSON Exp where
  toEncoding = genericToEncoding defaultOptions
instance FromJSON Exp

-- Navigation

data TreeDirection = Up | Down | Next | Prev


-- Util functions

insert :: Declaration -> Tree -> Tree
insert d (Tree t) = Tree (d : t)


remove :: Tree -> Tree
remove (Tree []) = Tree []
remove (Tree (x : xs)) = Tree xs


replace :: Declaration -> Tree -> Tree
replace d t = insert d (remove t)


-- Tests

testFunc :: AnonFunc
testFunc = AnonFunc ["x", "y"] (ExpInt 3)


testDecl :: Declaration
testDecl = Declaration "foo" testFunc


testTree :: Tree
testTree = Tree [testDecl]
