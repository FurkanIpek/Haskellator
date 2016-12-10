module Main (main) where

import Utils.MiscUtils as Utils
import Types.Texts as Texts
import qualified Data.List as List

main :: IO Integer
main
    = let
        arr = [1, 3, 12, 70, -5]
        haskellatorCodeBase = Texts.Code { repoName = "Haskellator", contributors = ["Furkan Ipek", "mfi"]}
    in
        do
            print $ "Sorted array: " ++ show (Utils.quicksort arr)
            print $ "Following is a summary of this code base: "
            print $ "Repository name: " ++ repoName haskellatorCodeBase 
            print $ "Contributors: " ++ List.intercalate ", " (contributors haskellatorCodeBase)
           
            return 0