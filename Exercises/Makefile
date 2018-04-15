all:
	clear
	@echo "------------------------------------------------------"
	gfortran $(FILE) -o Tester.out
	#gfortran -e $(FILE) #compile f77 to allow extended lines (more than the limit)
	@echo ""
	./Tester.out
	@echo ""
	@echo "------------------------------------------------------"
	make clean
	@echo ""

clean:
	rm -f *.out *.mod*

plot:
	clear
	@echo "----------------------PLOTTING--------------------"
	@echo "File: " + $(FILE)