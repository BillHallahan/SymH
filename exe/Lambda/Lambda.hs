{-# LANGUAGE QuasiQuotes #-}

module Lambda.Lambda where

import Lambda.Interpreter
import SymH.SymH

lambdaTest1 :: IO (Maybe Expr)
lambdaTest1 = [g2| \(x :: Int ) -> ?(symExpr :: Expr) |
      let env = [] in
      let expr = App (Lam "b" (Var "b")) symExpr in
        eval env expr == (Const (I 40)) |] 0


lambdaTest2 :: IO (Maybe Expr)
lambdaTest2 = [g2| \(x :: Int ) -> ?(symExpr :: Expr) |
      let env = [] in
      let expr = symExpr in
        eval env expr == (Const (I 43)) |] 0

{-
lambdaTest3 :: IO (Maybe Expr)
lambdaTest3 = [g2| \(x :: Int) -> ?(symExpr :: Expr) |
      let env = [] in
      let expr = App symExpr (Const (I 27)) in
        eval env expr == (Const (I 27)) |] 0
-}

lambdaTest3 :: IO (Maybe Expr)
lambdaTest3 = [g2| \(x :: Int) -> ?(symExpr :: Expr) |
      let env = [] in
      let expr1 = App symExpr (Const (I 27)) in
      let expr2 = App symExpr (Const (I 43)) in
        eval env expr1 == (Const (I 27))
        && eval env expr2 == (Const (I 43)) |] 0

lambdaTest4 :: [(Int, Int)] -> IO (Maybe Expr)
lambdaTest4 pairs = [g2| \(xs :: [(Int, Int)]) -> ?(symExpr :: Expr) |
      let env = [] in
        all (\(i, o) -> eval env (App symExpr (Const (I i))) == Const (I o)) xs |] pairs



