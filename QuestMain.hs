module Main where

import Types

describeLocation :: Location -> String
describeLocation loc = show loc ++ "\n" ++
		case loc of
            Home         -> "You are standing in the middle room at the wooden table."
            Friend'sYard -> "You are standing in the front of the night garden behind the small wooden fence."
            Garden       -> "You are in the garden. Garden looks very well: clean, tonsured, cool and wet."
            otherwise    -> "No description available for location with name " ++ show loc ++ "."

			
walk :: Location -> Direction -> Location
walk Home North         = Garden
walk Home South         = Friend'sYard
walk Garden North       = Friend'sYard
walk Garden South       = Home
walk Friend'sYard North = Home
walk Friend'sYard South = Garden
walk curLoc _           = curLoc


-- ������������ ��������.
evalAction :: Action -> String
evalAction act = "Action: " ++ show act ++ "!"

-- ��������������� ������ � Action
convertStringToAction :: String -> Action
convertStringToAction str = read str

-- �������� ���� � ����������, ������������ ��� � ��������, �������� ����������, ������� ���������.
run curLoc = do
		putStrLn (describeLocation curLoc)
		putStr "Enter command: "
		x <- getLine
		case (convertStringToAction x) of
			Quit          -> putStrLn "Be seen you..."
			Look          -> do
								putStrLn (describeLocation curLoc)
								run curLoc
			Go dir        -> do
								putStrLn ("\nYou walking to " ++ show dir ++ ".\n")
								run (walk curLoc dir)
			convertResult -> do
								putStrLn (evalAction convertResult)
								putStrLn "End of turn.\n"
								run curLoc

main = do
	putStrLn "Quest adventure on Haskell.\n"
	run Home