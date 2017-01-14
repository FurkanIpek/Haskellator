module Types.Date (
    Date(..),
    Year,
    Month(..),
    Day(..)
)
where

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
            deriving(Eq, Ord, Read, Show, Bounded, Enum)

data Month = January | February | March | April | May | June
            | July | August | September | October | November | December
            deriving(Eq, Ord, Read, Show, Bounded, Enum)

--data (Int a) => Year a = Year deriving (Eq, Ord, Read, Show)
type Year = Int

data Date = Date { day :: Day, month :: Month, year :: Year } deriving (Eq, Ord, Read, Show)