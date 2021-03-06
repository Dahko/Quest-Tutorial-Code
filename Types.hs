module Types where

data Location =
		  Home
		| Friend'sYard
		| Garden
		| OtherRoom
	deriving (Eq, Show, Read)

data Direction =
			  North
			| South
			| West
			| East
	deriving (Eq, Show, Read)

data Action =
		  Look
		| Go Direction
		| Inventory
		| Take
		| Drop
		| Investigate Object
		| Quit 
		| Save 
		| Load 
		| New
    deriving (Eq, Show, Read)

data Object = Table
			| Umbrella
			| Drawer
			| Phone
			| MailBox
			| Friend'sKey
	deriving (Eq, Show, Read)