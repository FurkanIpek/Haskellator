module Types.TrafficLight (
    trafficLightModule
) where

import Control.Monad

class Timeoutable a where
    timeout :: Int -> a -> IO ()

data TrafficLight = Green | Yellow | Red

instance Eq TrafficLight where
    -- Make this type an instance of Eq by hand BEGIN --
    Green == Green   = True
    Yellow == Yellow = True
    Red == Red       = True
    _ == _           = False
    -- Reason this works is that in Eq class, '==' defined as not '/='.
    -- So, by defining '==', we also define '/=' implicitly. This is called
    -- minimal completion.
    -- Make this type an instance of Eq by hand END --

instance Show TrafficLight where
    show Green  = "green light"
    show Yellow = "yellow light"
    show Red    = "red light"

instance Timeoutable TrafficLight where
    timeout t x  = print $ "Timeout duration for " ++ show x ++ " is " ++ show t

trafficLightModule :: IO ()
trafficLightModule =
    let
        light = Green
        t = 30
    in
        do
            putStr $ "--||## {TRAFFICLIGHT SECTION BEGINS} ##||--" ++ "\n"
            timeout t light
            -- When True stmt is equivalent of
            -- if True then stmt else return ()
            -- so instead of using an else block, we use when.
            when True $
                print "Afk"
            putStr $ "--||## {TRAFFICLIGHT SECTION ENDS} ##||--" ++ "\n"