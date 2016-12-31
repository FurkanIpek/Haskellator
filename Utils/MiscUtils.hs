module Utils.MiscUtils (
    quicksort,
    mergesort,
    replicate',
    titleCase
)
where

import Data.Char(toUpper, toLower)

{- A cheesy quicksort implementation. Doesn't actually sort in place. -}
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort all@(x:xs) = 
    let
        left  = filter (\elem -> elem <  x) xs
        right = filter (\elem -> elem >= x) xs
    in
        (quicksort left) ++ [x] ++ (quicksort right)

{- Mergesort implementation. And this one is an actual implementation :) -}
mergesort :: (Ord a) => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort x =
    let
        mid   = (length x) `div` 2
        left  = take mid x
        right = drop mid x
    in
        merge (mergesort left) (mergesort right)
    where
        merge x [] = x
        merge [] y = y
        merge x y
            | (head x) >  (head y) = (head y) : (merge (tail y) x)
            | (head x) <= (head y) = (head x) : (merge (tail x) y)

{- A replica of replicate function. -}
replicate' :: Int -> a -> [a]
replicate' n x
    | n < 0     = error $ "Cannot replicate " ++ (show n) ++ " times!"
    | n == 0    = []
    | otherwise = x : (replicate' (n-1) x)


{-
    Accumulation starts with a space coz during folding, beginning of words are captured via
    spaces so inital space helps us make first letter titleCase. After folding, tail of the
    result is returned to make sure that we do not include this extra space in the result.
-}
titleCase :: String -> String
titleCase ls  =
    tail
        $ foldl
            (\ acc x ->
                if (last acc) == ' ' then
                    acc ++ [(Data.Char.toUpper x)]
                else
                    acc ++ [x]
            )
        [' '] ls