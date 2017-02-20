# Spec of mini Haskell

SourceCodeFile -> [Function]

Function -> Type Exp

Type -> ConType | Arrow Type Type

ConType -> Int | Bool

Exp -> ConExp | FuncExp | Apply FuncExp Exp

FuncExp -> Symbol

ConExp -> Int | Bool | Symbol
