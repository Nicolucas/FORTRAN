FC= gfortran

all:
	clear
	@echo "------------------------------------------------------"
	$(FC) $(FILE) -o Tester.exe
	@echo ""
	./Tester.exe
	@echo ""
	@echo "------------------------------------------------------"
	make clean
	@echo ""


Convert:
	clear
	@echo "------------------------------------------------------"
	$(FC) Cl10_Binary_Conv.f -o Tester.exe
	@echo ""
	./Tester.exe <Data.dat
	@echo ""
	@echo "------------------------------------------------------"
	make clean
	@echo ""



hello:
	$(FC) Cl01_HelloWorld.f -o helloWorld
	./helloWorld

%.o : %.f
	$(FC) -c $< 

segfault :
	$(FC) -fbounds-check $(FILE) -o Tester.exe
	
clean:
	rm -f *.out *.mod* *.exe 

plot:
	clear
	@echo "------------------------------------------------------"
	$(FC) Cl12_Chemical.f -o Tester.exe
	@echo ""
	./Tester.exe 
	@echo ""
	gnuplot GnuPlotting.dem
	@echo ""
	@echo "------------------------------------------------------"
	make clean
	@echo ""

help:
	@echo "Valid targets:"
	@echo "  *.f"
	@echo "  *.f90"
	@echo "  *.o"
	@echo "clean: removes .out .mod and .exe files"
	@echo "plot: plots in GNUPLOT"
	#gfortran -e $(FILE) #compile f77 to allow extended lines (more than the limit)
