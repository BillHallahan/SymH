{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Arithmetics.Interpreter where

import SymH.SymH
import Data.Data

type Ident = String

data Expr
  = I Int
  | Var Ident
  | Add Expr Expr
  | Mul Expr Expr
  | Assign Ident Expr
  | Seq Expr Expr
  deriving (Eq, Show, Data)

$(derivingG2Rep ''Expr)

type Env = [(Ident, Int)]

eval :: Env -> Expr -> (Env, Int)
eval env (I int) = (env, int)
eval env (Var ident) =
  case lookup ident env of
    Just v -> (env, v)
    _ -> (env, 0)
    -- _ -> error $ "eval: " ++ show (env, ident)
eval env (Add expr1 expr2) =
  let lhs = snd $ eval env expr1
      rhs = snd $ eval env expr2
  in (env, lhs + rhs)
eval env (Mul expr1 expr2) =
  let lhs = snd $ eval env expr1
      rhs = snd $ eval env expr2
  in (env, lhs * rhs)
eval env (Assign ident rhs) =
  let res = snd $ eval env rhs
  in ((ident, res) : env, res)
eval env (Seq expr1 expr2) =
  let env2 = fst $ eval env expr1
  in eval env2 expr2


