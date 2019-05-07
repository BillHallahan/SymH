{-# LANGUAGE QuasiQuotes #-}

module Arithmetics.Arithmetics where

import Arithmetics.Interpreter
import SymH.SymH

-- Should be able to do this within around 30 seconds.
arithTest1 :: IO (Maybe Expr)
arithTest1 = [g2| \(x :: Int) -> ?(symExpr :: Expr) |
    (snd $ (eval [] symExpr)) == 5 |] 0


-- Can't do this; too slow
arithTest2 :: IO (Maybe Expr)
arithTest2 = [g2| \(x :: Int) -> ?(symExpr :: Expr) |
    (eval [] symExpr) == ([("a", 5)], 5) |] 0


-- This runs in less than 15 secs with
-- VarLookup Halter + CaseCount Orderer
triplesTo30 :: IO (Maybe (Expr, Expr, Expr))
triplesTo30 =
  [g2| \(a :: Int) -> ?(x :: Expr)
                      ?(y :: Expr)
                      ?(z :: Expr) |
  (snd $ eval [] (Mul x (Mul y z))) == 30|] 0


