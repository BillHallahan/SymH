module Main where

import Infinite.Infinite
import Infinite.InfList

import Arithmetics.Arithmetics
import Arithmetics.Interpreter

import SumToN

import SymH.SymH

main :: IO ()
main = do
    putStrLn "sumToN"
    print =<< sumToN 0 [-5, 10, -15, 20, 25]

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

    return ()

