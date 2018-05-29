c--------------------------------------------------------------------
c     Possibility #1 BRUTAL FORCE:
c   Recipe:
c   Ingredients:
c       -Familiy members
c       -Loop(x5) that assigns family members a True/False value
c       -Subroutine that tests rules on Family members
c   Directions:
c   -The PROGRAM calls a loop (x5) for each of the 2^5 possible combinations 
c           (maybe in a Subroutine?) and assigns a true/false value to each family member
c   -Then in a Subroutine inside the loop (x5), test out if the combination is plaussible
c           (or skip to the next combination #HowToSkipABeat #IsItWorthIt?)
c--------------------------------------------------------------------
c   Possibility #1.1 -Too much effort-
c   Instead of having the sweet loop(x5), why not a int counter converted to binary
c       and then assigns each digit to a family member? #WhatAboutTheConversionBack
c       #2007 Br(INT)ey Spears might not be that Logical, you know?
c--------------------------------------------------------------------

      PROGRAM MrAndMsSmith
        IMPLICIT NONE
        LOGICAL MJHNSN, FJHNSN, TIM, SARAH, JACK
        integer i,j,k,l,m,Count
	
        PRINT *,' Welcome to the program -Mr. and Ms. Smith-'
        PRINT *,' (Not Starring Brad Pitt nor Angelina Jolie)'
        PRINT *,''
        PRINT *,' -Based on 99 Logeleien von Zweistein/mit Antworten-'
        PRINT *,''

        Count=0
        DO 450,L = 0,1
           MJHNSN=L.EQ.1
            DO 350,K = 0,1
               FJHNSN=K.EQ.1
                DO 250,I = 0,1
                   TIM=I.EQ.1
                   DO 150,M = 0,1
                      SARAH=M.EQ.1
                      DO 50,J = 0,1
                         JACK=J.EQ.1
                         Count=Count+1
                         CALL TestTheRules(MJHNSN, FJHNSN,
     &                        TIM, SARAH, JACK,Count)
50                    CONTINUE
150                CONTINUE 
250             CONTINUE
350         CONTINUE   
450     CONTINUE  
        Print*,Count
      
      END PROGRAM MrAndMsSmith

c--------------------------------------------------------------------
c--------------------------------------------------------------------
c   Subroutine that tests the following Rules:
c   RULES:
c   If Mr. Johnson comes, he will bring his wife with him.
c   At least one of their children Sarah and Jack will come.
c   Either Mrs. Johnson comes or Timothy.
c   Either Timothy and Sarah both come, or none of them.
c   if Jack comes then Sarah and Mr. Johnson will come, too.

c   ...Ms Smith, Take a seat as this will take a while...
c--------------------------------------------------------------------
      Subroutine TestTheRules(MJHNSN, FJHNSN, TIM, SARAH, JACK,Count)
      IMPLICIT NONE
        LOGICAL MJHNSN, FJHNSN, TIM, SARAH, JACK, a,b,implies
        Integer count

c       IF(MJHNSN) THEN
c          IF(.NOT.FJHNSN) THEN
c            return
c          ENDIF
c       ENDIF

        b=FJHNSN
        a=IMPLIES(MJHNSN,b)
        IF(a) return

        IF(.NOT.(SARAH.OR.TIM.OR.JACK)) THEN
           return
        ENDIF
      
        IF(FJHNSN.EQV.TIM) THEN
             return
        ENDIF
           
        IF(TIM.NEQV.SARAH)THEN
           return
        ENDIF
        
c       IF(JACK) THEN
c          IF (.NOT.(SARAH.and.MJHNSN))THEN
c            return
c          ENDIF
c       ENDIF

        b=SARAH.and.MJHNSN
        a=IMPLIES(JACK,b)
        IF(a) return
        
        
          PRINT *,''
          PRINT *,'Mr Jhonson:',MJHNSN,'- Ms Jhonson:',FJHNSN,
     &         '- Sarah:',Sarah,' - Jack:',Jack,'- Timothy:',TIM
          PRINT *,''
          
      IF(MJHNSN) THEN
      Print*,"Mr Jhonson Will come tonight"
      ENDIF
      IF(FJHNSN) THEN
      Print*,"Ms Jhonson Will come tonight"
      ENDIF
      IF(Sarah) THEN
      Print*,"Sarah Will come tonight"
      ENDIF
      IF(Jack) THEN
      Print*,"Jack Will come tonight"
      ENDIF
      IF(TIM) THEN
      Print*,"Timothy Will come tonight"
      ENDIF
          PRINT *,''
          
               
      END SUBROUTINE TestTheRules



c To enhance readability; create a function IMPLIES to represent a implies b, so
c if a is true, then b must be true, or the other way around, if b is false, a cannot be true
c Thus: The implication is false until proven true

      Logical function IMPLIES(a,b)
        IMPLICIT NONE
        Logical a,b
        IMPLIES=.FALSE.
        IF(a) THEN
           IF (.NOT.(b))THEN
             IMPLIES=.TRUE.
           ENDIF
        ENDIF
      END function IMPLIES
