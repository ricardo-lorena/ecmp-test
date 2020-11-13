#simulator flags
VLOG = iverilog -W all -g2005-sv -ILIB/hardware/include
VSRC := circuit.v circuit_tb.v

circuit.vcd: $(VSRC)
	$(VLOG) $(VSRC)
	./a.out $(LOG)

waves: circuit.vcd
	gtkwave -a waves.gtkw $< &

clean:
	@rm -f ./a.out *.log *~ *.vcd

.PHONY: waves clean
