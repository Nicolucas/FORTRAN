all:
	clear
	@echo "------------------------------------------------------"
	gfortran $(FILE) -o Tester.exe
	#gfortran -e $(FILE) #compile f77 to allow extended lines (more than the limit)
	@echo ""
	./Tester.exe
	@echo ""
	@echo "------------------------------------------------------"


%.o : %.f90
	gfortran -c $< 

clean:
	rm -f *.out *.mod* *.exe

plot:
	clear
	@echo "----------------------PLOTTING--------------------"
	@echo "File: " + $(FILE)
