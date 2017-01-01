module Types.Tree (
    treeModule
) where

data Tree a = NilNode | Node { value :: a, left :: (Tree a), right :: (Tree a) } deriving(Show, Eq, Ord)

makeTree :: a -> Tree a
makeTree x = Node x NilNode NilNode

insertTree :: (Ord a) => a -> Tree a -> Tree a
insertTree x NilNode = makeTree x
insertTree x (Node a left right)
    | x == a = Node x left right
    | x > a  = Node a left (insertTree x right)
    | x < a  = Node a (insertTree x left) right

elemTree :: (Ord a) => a -> Tree a -> Bool
elemTree x NilNode = False
elemTree x (Node a left right)
    | x == a = True
    | x > a  = elemTree x right
    | x < a  = elemTree x left

treeModule :: IO()
treeModule =
    let
        numbers = [7, 5, 9, 6]
        tree = foldl (\ acc x -> insertTree x acc) NilNode numbers
    in
        do
            putStr $ "--||## {TREE SECTION BEGINS} ##||--" ++ "\n"
            print tree
            putStr $ "\nNow lets insert 8 to this tree" ++ "\n\n"
            print $ show $ insertTree 8 tree
            putStr $ "\nIs 5 an element of our tree: " ++ (show $ elemTree 5 tree) ++ "\n"
            putStr $ "--||## {TREE SECTION ENDS} ##||--" ++ "\n\n"
        