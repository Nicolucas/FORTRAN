FC= gfortran

all:
	clear
	@echo "------------------------------------------------------"
	$(FC) $(FILE) -o Tester.exe
	#gfortran -e $(FILE) #compile f77 to allow extended lines (more than the limit)
	@echo ""
	./Tester.exe
	@echo ""
	@echo "------------------------------------------------------"
	make clean
	@echo ""


%.o : %.f90
	$(FC) -c $< 

segfault :
	$(FC) -fbounds-check $(FILE) -o Tester.exe
clean:
	rm -f *.out *.mod* *.exe

plot:
	clear
	@echo "----------------------PLOTTING--------------------"
	@echo "File: " + $(FILE)
	plot $(FILE)

help:
	@echo "Valid targets:"
	@echo "  *.f"
	@echo "  *.f90"
	@echo "  *.o"
	@echo "clean: removes .out .mod and .exe files"
	@echo "plot: plots in GNUPLOT"
