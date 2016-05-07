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
sim: counter_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la sintetis completa
#- y dejar el diseno listo para su grabacion en
#- la FPGA
#-----------------------------------------------
sint: counter.bin

#-------------------------------
#-- Compilacion y simulacion
#-------------------------------
counter_tb.vcd: counter.v counter_tb.v

	#-- Compilar
	iverilog -o counter.out counter.v counter_tb.v

	#-- Simular
	./counter.out

	#-- Crear VCD
	vvp counter.out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave counter.vcd &

#------------------------------
#-- Sintesis completa
#------------------------------
counter.bin: counter.v counter.pcf

	#-- Sintesis
	/usr/local/bin/yosys -p "synth_ice40 -blif counter.blif" counter.v

	#-- Place & route
	arachne-pnr -d 1k -p counter.pcf counter.blif -o counter.txt

	#-- Generar binario final, listo para descargar en fgpa
	icepack counter.txt counter.bin

#-- Cargar en FPGA
load:
	iceprog counter.bin

#-- Limpiar todo
clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
