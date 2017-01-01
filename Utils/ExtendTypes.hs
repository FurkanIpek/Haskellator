module Utils.ExtendTypes(
    prettyPrint
) where

{-
    - Add your pretty print implementations here. IDK why you should, but you SHOULD :P
-}

import Types.Texts as Texts

class Printable a where
    prettyPrint :: a -> IO()
    prettyPrint _ = print "This is default pretty print implementation, you should overwrite it!"

instance Printable Int where
    prettyPrint a = print $ "Extended integer print: " ++ show a

instance Printable Texts.Text where
    prettyPrint (Code x y)   = print "This is a freaking code base fellas!"
    prettyPrint (Book x y z) = print "Gosh! It's a book!"