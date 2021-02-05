---- MODULE MC ----
EXTENDS RiverCrossing, TLC

\* CONSTANT definitions @modelParameterConstants:0Farmyard
const_1612528848574180000 == 
{ "Wolf", "Sheep", "Cabbage" }
----

\* CONSTANT definitions @modelParameterConstants:1Predates
const_1612528848574181000 == 
{ <<"Wolf","Sheep">> , <<"Sheep","Cabbage">> }
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1612528848574182000 ==
\lnot Complete
----
=============================================================================
\* Modification History
\* Created Fri Feb 05 12:40:48 GMT 2021 by alunm
