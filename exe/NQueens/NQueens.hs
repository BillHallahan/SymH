{-# LANGUAGE QuasiQuotes #-}

module NQueens.NQueens where

import NQueens.Encoding
import SymH.SymH

queensTestN :: Int -> IO (Maybe [Queen])
queensTestN n = [g2| \(n :: Int) -> ?(queens :: [Queen]) |
                  legalQueens n queens
                    && allSafe queens |] n


