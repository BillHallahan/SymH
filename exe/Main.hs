module Main where

import Infinite.Infinite
import Infinite.InfList

import SymH.SymH

main :: IO ()
main = do
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

    putStrLn "infiniteReturnNoTerm"
    print =<< infiniteReturnNoTerm
    
    putStrLn "errorTest20"
    print =<< errorTest20

    putStrLn "errorTest10"
    print =<< errorTest10

    -- putStrLn "justNonTermTest"
    -- print =<< justNonTermTest

    -- putStrLn "nothingNonTermTest"
    -- print =<< nothingNonTermTest
    return ()

