{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Arithmetics.Interpreter where

import SymH.SymH
import Data.Data


data Expr
  = I Int
  | B Bool
  | Add Expr Expr
  | Mul Expr Expr
  | Eq Expr Expr
  | Cond Expr Expr Expr
  deriving (Eq, Show, Data)

$(derivingG2Rep ''Expr)


eval :: Expr -> Expr
eval (Add e1 e2) = case (eval e1, eval e2) of
    (I i1, I i2) -> I (i1 + i2)
    otherwise -> error $ "eval: Add: " ++ show otherwise
eval (Mul e1 e2) = case (eval e1, eval e2) of
    (I i1, I i2) -> I (i1 * i2)
    otherwise -> error $ "eval: Mul " ++ show otherwise
eval (Eq e1 e2) = B (eval e1 == eval e2)
eval (Cond cond true false) = case eval cond of
  (B True) -> eval true
  (B False) -> eval false
  otherwise -> error $ "eval: Cond: " ++ show otherwise



