{-# LANGUAGE QuasiQuotes #-}

module Infinite.Infinite where

import Infinite.InfList
import SymH.SymH

nothingTest :: IO (Maybe Int)
nothingTest = [g2| \(x :: Int) -> ?(y :: Int) | x > y && y > 0 |] 0

nothingTest2 :: IO (Maybe Int)
nothingTest2 = [g2| \(xs :: [Int]) -> ?(y :: Int) | head xs > y && y > 0 |] [0..]

infiniteTest :: IO (Maybe Int)
infiniteTest = [g2| \(xs :: [Int]) -> ?(x :: Int) | x == head xs |] [1..]

infiniteTest2 :: IO (Maybe [Int])
infiniteTest2 = [g2| \(xs :: [Int]) (t :: Int) -> ?(ys :: [Int]) | ys == take t xs |] [1..] 4

infiniteReturn :: IO (Maybe Int)
infiniteReturn = do
    res <- [g2| \(t :: Int) -> ?(ys :: InfList Int) | headInf ys == t |] 1
    return $ fmap headInf res

infiniteReturnNoTerm :: IO (Maybe (InfList Int))
infiniteReturnNoTerm = [g2| \(x :: Int) -> ?(ys :: InfList Int) | allInf (> x) ys |] 0

justNonTermTest :: IO (Maybe [Int])
justNonTermTest = [g2| \(xs :: [Int]) -> ?(ys :: [Int]) | xs == ys |] [0..]

nothingNonTermTest :: IO (Maybe Int)
nothingNonTermTest = [g2| \(xs :: [Int]) -> ?(y :: Int) | all (\x -> y > x) xs |] [0..]

errorTest20 :: IO (Maybe Int)
errorTest20 = [g2| \(xs :: [Int]) -> ?(y :: Int) | y `elem` xs |] ([1..20] ++ [undefined] ++ [0..])

errorTest10 :: IO (Maybe Int)
errorTest10 = [g2| \(xs :: [Int]) -> ?(y :: Int) | y `elem` xs |] ([1..10] ++ [undefined] ++ [0..])

recPred :: IO (Maybe Int)
recPred = [g2| \(x :: Int) -> ?(n :: Int) | addNTimes n x == 10 |] 3