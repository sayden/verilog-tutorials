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
sim: prescaler_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la sintetis completa
#- y dejar el diseno listo para su grabacion en
#- la FPGA
#-----------------------------------------------
sint: prescaler.bin

#-------------------------------
#-- Compilacion y simulacion
#-------------------------------
prescaler_tb.vcd: prescaler.v prescaler_tb.v

	#-- Compilar
	iverilog -o prescaler.out prescaler.v prescaler_tb.v

	#-- Simular
	./prescaler.out

	#-- Crear VCD
	vvp prescaler.out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave prescaler.vcd &

#------------------------------
#-- Sintesis completa
#------------------------------
prescaler.bin: prescaler.v prescaler.pcf

	#-- Sintesis
	/usr/local/bin/yosys -p "synth_ice40 -blif prescaler.blif" prescaler.v

	#-- Place & route
	arachne-pnr -d 1k -p prescaler.pcf prescaler.blif -o prescaler.txt

	#-- Generar binario final, listo para descargar en fgpa
	icepack prescaler.txt prescaler.bin

#-- Cargar en FPGA
load:
	iceprog prescaler.bin

#-- Limpiar todo
clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
