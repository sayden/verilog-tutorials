#-------------------------------------------------------
#-- Objetivo por defecto: hacer simulacion y sintesis
#-------------------------------------------------------
all: sint

#----------------------------------------------
#-- make sim
#----------------------------------------------
#-- Objetivo para hacer la simulacion del
#-- banco de pruebas
#----------------------------------------------
sim: multiple_prescaler_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la sintetis completa
#- y dejar el diseno listo para su grabacion en
#- la FPGA
#-----------------------------------------------
sint: multiple_prescaler.bin

#-------------------------------
#-- Compilacion y simulacion
#-------------------------------
multiple_prescaler_tb.vcd: multiple_prescaler.v multiple_prescaler_tb.v

	#-- Compilar
	iverilog -o multiple_prescaler.out multiple_prescaler.v multiple_prescaler_tb.v

	#-- Simular
	./multiple_prescaler.out

	#-- Crear VCD
	vvp multiple_prescaler.out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave multiple_prescaler.vcd &

#------------------------------
#-- Sintesis completa
#------------------------------
multiple_prescaler.bin: multiple_prescaler.v multiple_prescaler.pcf

	#-- Sintesis
	/usr/local/bin/yosys -p "synth_ice40 -blif multiple_prescaler.blif" multiple_prescaler.v

	#-- Place & route
	arachne-pnr -d 1k -p multiple_prescaler.pcf multiple_prescaler.blif -o multiple_prescaler.txt

	#-- Generar binario final, listo para descargar en fgpa
	icepack multiple_prescaler.txt multiple_prescaler.bin

#-- Cargar en FPGA
load:
	iceprog multiple_prescaler.bin

#-- Limpiar todo
clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
