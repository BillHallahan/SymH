module Main where

import Infinite.Infinite

import SymH.SymH

main :: IO ()
main = do
    putStrLn "infiniteTest"
    print =<< infiniteTest
    
    putStrLn "infiniteTest2"
    print =<< infiniteTest2

    putStrLn "infiniteReturn"
    print =<< infiniteReturn
    return ()