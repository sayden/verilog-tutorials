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
sim: four_bit_counter_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la sintetis completa
#- y dejar el diseno listo para su grabacion en
#- la FPGA
#-----------------------------------------------
sint: four_bit_counter.bin

#-------------------------------
#-- Compilacion y simulacion
#-------------------------------
four_bit_counter_tb.vcd: four_bit_counter.v four_bit_counter_tb.v

	#-- Compilar
	iverilog -o four_bit_counter.out four_bit_counter.v four_bit_counter_tb.v

	#-- Simular
	./four_bit_counter.out

	#-- Crear VCD
	vvp four_bit_counter.out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave four_bit_counter.vcd &

#------------------------------
#-- Sintesis completa
#------------------------------
four_bit_counter.bin: four_bit_counter.v four_bit_counter.pcf

	#-- Sintesis
	/usr/local/bin/yosys -p "synth_ice40 -blif four_bit_counter.blif" four_bit_counter.v

	#-- Place & route
	arachne-pnr -d 1k -p four_bit_counter.pcf four_bit_counter.blif -o four_bit_counter.txt

	#-- Generar binario final, listo para descargar en fgpa
	icepack four_bit_counter.txt four_bit_counter.bin

#-- Cargar en FPGA
load:
	iceprog four_bit_counter.bin

#-- Limpiar todo
clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
