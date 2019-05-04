{-# LANGUAGE QuasiQuotes #-}

module Arithmetics.Arithmetics where

import Arithmetics.Interpreter
import SymH.SymH

equals12Test :: IO (Maybe Int)
equals12Test = [g2| \(x :: Int) -> ?(a :: Int) |
                        eval (Add (I a) (I 5)) == I x |] 12

