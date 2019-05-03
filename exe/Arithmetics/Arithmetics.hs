{-# LANGUAGE QuasiQuotes #-}

module Arithmetics.Arithmetics where

import Arithmetics.Interpreter
import SymH.SymH

equals12Test :: IO (Maybe (Int, Int))
equals12Test = [g2| \(x :: Int) -> ?(a :: Int) ?(b :: Int) |
                        eval (Add (I a) (I b)) == I x |] 12

