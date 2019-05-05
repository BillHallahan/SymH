module Main where

import Infinite.Infinite
import Infinite.InfList

import Arithmetics.Arithmetics
import Arithmetics.Interpreter

import Imperative.Imperative as Imp
import Imperative.Interpreter as Imp

import NQueens.NQueens
import NQueens.Encoding

import Lambda.Lambda as Lam
import Lambda.Interpreter as Lam

-- import SumToN

import SymH.SymH

main :: IO ()
main = do


    -- putStrLn "sumToN"
    -- print =<< sumToN 0 [-5, 10, -15, 20, 25]

    putStrLn "nothingTest"
    print =<< nothingTest

    putStrLn "nothingTest2"
    print =<< nothingTest2

    putStrLn "infiniteTest"
    print =<< infiniteTest
    
    putStrLn "infiniteTest2"
    print =<< infiniteTest2

    putStrLn "infiniteReturn"
    print =<< infiniteReturn

---------
    -- putStrLn "infiniteReturnNoTerm"
    -- print =<< infiniteReturnNoTerm

    -- putStrLn "errorTest20"
    -- print =<< errorTest20

    -- putStrLn "errorTest10"
    -- print =<< errorTest10

    -- putStrLn "recPred"
    -- print =<< recPred

    -- putStrLn "justNonTermTest"
    -- print =<< justNonTermTest

    -- putStrLn "nothingNonTermTest"
    -- print =<< nothingNonTermTest
------------

    putStrLn "equals12Test"
    print =<< equals12Test

    -- putStrLn "Imperative"
    -- putStrLn $ show $ Imp.eval (fst prog1) (snd prog1)

    -- putStrLn "imperativeTest1"
    -- print =<< imperativeTest1


    -- putStrLn "imperativeTest2"
    -- print =<< imperativeTest2

    -- putStrLn "queensTest4"
    -- print =<< queensTest4

    putStrLn "lambdaTest2"
    print =<< lambdaTest2

    return ()

