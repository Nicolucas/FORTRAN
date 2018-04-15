      PROGRAM Temp_Conversion
      IMPLICIT NONE
      INTEGER:: Deg_F, Deg_C, K, natur(1000,1000)
      ! CARAJO
      
  5   PRINT*, "Please type in the temp ln F"
      READ*, Deg_F
      Deg_C = 5*(Deg_F-32)/9
      PRINT*, "This is equal to", Deg_C, "C"
      K = Deg_C + 273
      PRINT*, "and", K, "K"

      !Goto 5
      END PROGRAM Temp_Conversion
