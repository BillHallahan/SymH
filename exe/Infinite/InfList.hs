{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Infinite.InfList where

import SymH.SymH
import Data.Data

data InfList a = InfCons a (InfList a) deriving (Show, Data)

$(derivingG2Rep ''InfList)

repeatInf :: a -> InfList a
repeatInf x = InfCons x (repeatInf x)

headInf :: InfList a -> a
headInf (InfCons x _) = x

tailInf :: InfList a -> InfList a
tailInf (InfCons x xs) = xs

allInf :: (a -> Bool) -> InfList a -> Bool
allInf p (InfCons x xs) = p x && allInf p xs

addNTimes :: Int -> Int -> Int
addNTimes n x
    | n <= 0 = x
    | otherwise = x + addNTimes (n - 1) x