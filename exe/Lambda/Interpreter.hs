{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Lambda.Interpreter where

import Data.Data
import Data.List
import SymH.SymH

type Id = String

data Prim = I Int | B Bool | Fun Id
  deriving (Show, Eq, Data)

$(derivingG2Rep ''Prim)

data Expr
  = Var Id
  | Lam Id Expr
  | App Expr Expr
  | Const Prim
  deriving (Show, Eq, Data)

$(derivingG2Rep ''Expr)

type Env = [(Id, Expr)]

eval :: Env -> Expr -> Expr
eval env (Var ident) =
  case lookup ident env of
    Just expr -> eval env expr
    Nothing -> Const (Fun ident)
eval env (App (Lam ident body) arg) =
  eval ((ident, arg) : env) body
eval env (App (Const (Fun ident)) arg) =
  let arg2 = eval env arg
      ident2 = ident ++ " (" ++ show arg2 ++ ")"
  in Const (Fun ident2)
eval env (App lam arg) =
  eval env (App (eval env lam) arg)
eval _ expr = expr
    


