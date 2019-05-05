{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Imperative.Interpreter where

import SymH.SymH
import Data.Data
import Data.List

-- The IMP language

type Id = String

data AExp = I Int | Var Id | Add AExp AExp | Mul AExp AExp
  deriving (Show, Eq, Data)

$(derivingG2Rep ''AExp)

data BExp = B Bool | Not BExp | And BExp BExp | Or BExp BExp
  deriving (Show, Eq, Data)

$(derivingG2Rep ''BExp)

data Stmt = Skip | Assign Id AExp | Seq Stmt Stmt
    | If BExp Stmt Stmt | While BExp Stmt
  deriving (Show, Eq, Data)

$(derivingG2Rep ''Stmt)

type Env = [(Id, Int)]

type Prog = (Env, Stmt)

-- An interpreter for IMP

runProg :: Prog -> Int
runProg (decls, stmt) = snd $ eval decls stmt

evalA :: Env -> AExp -> Int
evalA e (I i) = i
evalA e (Add a1 a2) = evalA e a1 + evalA e a2
evalA e (Mul a1 a2) = evalA e a1 * evalA e a2
evalA e (Var id) = case lookup id e of
  Just i -> i
  Nothing -> 0
  -- Nothing -> error $ "evalA: unbound " ++ id

evalB :: BExp -> Bool
evalB (B b) = b
evalB (Not be) = not $ evalB be
evalB (And be1 be2) = evalB be1 && evalB be2
evalB (Or be1 be2) = evalB be1 || evalB be2

eval :: Env -> Stmt -> (Env, Int)
eval e (Skip) = (e, 0)
eval e (Seq st1 st2) =
  eval (fst $ eval e st1) st2
eval e (Assign id ae) =
  let rhs = evalA e ae
  in (insert (id, rhs) e, rhs)
eval e (If cond true false) =
  if (evalB cond) then
    eval e true
  else eval e false
eval e (While cond body) =
  if (evalB cond) then
    let (e', _) = eval e body
    in eval e' (While cond body)
  else
    (e, 0)




