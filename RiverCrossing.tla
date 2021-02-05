--------------------------- MODULE RiverCrossing ---------------------------
CONSTANTS Farmyard,
          Predates

VARIABLES Leftbank,
          Rightbank,
          Boat

TypeInvariant ==
          /\ Leftbank \subseteq Farmyard
          /\ Rightbank \subseteq Farmyard
          /\ Boat \in {"left","right"}

Init == 
          /\ Leftbank = Farmyard
          /\ Rightbank = {}
          /\ Boat =  "left"
------------
Eats(predator, prey) == <<predator,prey>> \in Predates

Opposite(bank) == IF bank="left" THEN "right" ELSE "left"

Safe(bank) == \lnot \E predator \in bank : 
                    \E prey \in bank : Eats(predator,prey)

Move(thing, From, To) == 
          /\ From' = From \ {thing}
          /\ To'   = To \union {thing}
          /\ Boat' = Opposite(Boat)

MoveLeft(thing) ==
          /\ Boat = "left"
          /\ Move( thing, Leftbank, Rightbank )
          /\ Safe(Leftbank')

MoveRight(thing) == 
          /\ Boat = "right"
          /\ Move( thing, Rightbank, Leftbank )
          /\ Safe(Rightbank')

MoveEmpty ==
          /\ Boat' = Opposite(Boat)
          /\ UNCHANGED Leftbank /\ Safe(Leftbank)
          /\ UNCHANGED Rightbank /\ Safe(Rightbank)
------------
Next == 
          \/ MoveEmpty
          \/ \E thing \in Leftbank : MoveLeft(thing) 
          \/ \E thing \in Rightbank : MoveRight(thing) 

Complete == 
          /\ Leftbank = {}
          /\ Rightbank = Farmyard

=============================================================================
\* Modification History
\* Last modified Fri Feb 05 12:40:48 GMT 2021 by alunm
\* Created Fri Feb 05 10:26:08 GMT 2021 by alunm
