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
sim: four_bit_register_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la sintetis completa
#- y dejar el diseno listo para su grabacion en
#- la FPGA
#-----------------------------------------------
sint: four_bit_register.bin

#-------------------------------
#-- Compilacion y simulacion
#-------------------------------
four_bit_register_tb.vcd: four_bit_register.v four_bit_register_tb.v

	#-- Compilar
	iverilog -o four_bit_register.out four_bit_register.v four_bit_register_tb.v

	#-- Simular
	./four_bit_register.out

	#-- Crear VCD
	vvp four_bit_register.out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave four_bit_register.vcd &

#------------------------------
#-- Sintesis completa
#------------------------------
four_bit_register.bin: four_bit_register.v four_bit_register.pcf

	#-- Sintesis
	/usr/local/bin/yosys -p "synth_ice40 -blif four_bit_register.blif" four_bit_register.v

	#-- Place & route
	arachne-pnr -d 1k -p four_bit_register.pcf four_bit_register.blif -o four_bit_register.txt

	#-- Generar binario final, listo para descargar en fgpa
	icepack four_bit_register.txt four_bit_register.bin

#-- Cargar en FPGA
load:
	iceprog four_bit_register.bin

#-- Limpiar todo
clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
