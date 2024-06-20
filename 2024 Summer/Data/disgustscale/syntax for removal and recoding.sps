
RECODE Q1 (0=4) (1=3) (3=1) (4=0).
EXECUTE.


RECODE Q6 (0=4) (1=3) (3=1) (4=0).
EXECUTE.


RECODE Q10 (0=4) (1=3) (3=1) (4=0).
EXECUTE.



COUNT
  miss = age gender Education Religion political Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9
  Q10 Q11 Q12 Q13 Q14 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 
  (MISSING)  .
EXECUTE .


COMPUTE miss_filter=1.
EXECUTE.

IF  (miss>0) miss_filter=0.
EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF ((Pregnant=1)  ).
EXECUTE.


FILTER OFF.
USE ALL.
SELECT IF ((Catch_response=1)  ).
EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF ((miss_filter=1)  ).
EXECUTE.

