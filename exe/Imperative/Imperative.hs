{-# LANGUAGE QuasiQuotes #-}

module Imperative.Imperative where

import Imperative.Interpreter
import SymH.SymH

prog1 :: Prog
prog1 = ([("a", 3), ("b", 5), ("c", 7)],
          Assign "d"
            (Mul (Add (Var "a") (Var "b"))
                 (Var "c")))

imperativeTest1 :: IO (Maybe AExp)
imperativeTest1 = [g2| \ (x :: Int) -> ?(ae :: AExp) |
        let env = [] in
        let stmt = Assign "a"
                    (Mul (Mul (I x) (I 5)) (ae))
          in runProg (env, stmt) == 100 |] 4

imperativeTest2 :: IO (Maybe String)
imperativeTest2 = [g2| \ (x :: Int) -> ?(str :: String) |
        let env = [("a", 4)] in
        let stmt = Seq (Assign str (I 5))
                    (Assign "c"
                        (Mul (Var "a") (Var "b")))
          in runProg (env, stmt) == 20 |] 0


