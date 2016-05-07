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
sim: initializer_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la sintetis completa
#- y dejar el diseno listo para su grabacion en
#- la FPGA
#-----------------------------------------------
sint: initializer.bin

#-------------------------------
#-- Compilacion y simulacion
#-------------------------------
initializer_tb.vcd: initializer.v initializer_tb.v

	#-- Compilar
	iverilog -o initializer.out initializer.v initializer_tb.v

	#-- Simular
	./initializer.out

	#-- Crear VCD
	vvp initializer.out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave initializer.vcd &

#------------------------------
#-- Sintesis completa
#------------------------------
initializer.bin: initializer.v initializer.pcf

	#-- Sintesis
	/usr/local/bin/yosys -p "synth_ice40 -blif initializer.blif" initializer.v

	#-- Place & route
	arachne-pnr -d 1k -p initializer.pcf initializer.blif -o initializer.txt

	#-- Generar binario final, listo para descargar en fgpa
	icepack initializer.txt initializer.bin

#-- Cargar en FPGA
load:
	iceprog initializer.bin

#-- Limpiar todo
clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
