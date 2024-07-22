module SMCDEL.Examples.E4_5 where

import SMCDEL.Explicit.S5 ( KripkeModelS5(..) )
import SMCDEL.Translations.S5 ()
import SMCDEL.Symbolic.S5 ( KnowStruct(..), boolBddOf )
import SMCDEL.Language ( Form(PrpF, Impl, Disj), Agent, Prp(..) )
import SMCDEL.Other.BDD2Form ( formOf )

myKnS1 :: KnowStruct
myKnS1 = KnS
    [P 1, P 2, P 3]
    (SMCDEL.Symbolic.S5.boolBddOf (Impl (Disj [PrpF (P 1),PrpF (P 2)]) (PrpF (P 3))))
    [("a", [P 1]), ("b", [P 2])]

myKrM1 :: KripkeModelS5
myKrM1 = KrMS5 
    [0,1,2]
    [("a", [[0], [1,2]]),
    ("b", [[0,1], [2]])]
    [(0,[(P 1,True ),(P 2,True )]), 
    (1,[(P 1,True ),(P 2,False)]), 
    (2,[(P 1,False),(P 2,True )])]

data KnowStructF = KnSF 
    [Prp]
    SMCDEL.Language.Form
    [(Agent,[Prp])]
    deriving (Eq, Show)

bddToForm :: KnowStruct -> KnowStructF
bddToForm (KnS psx lawx obsx) = KnSF psx (formOf lawx) obsx