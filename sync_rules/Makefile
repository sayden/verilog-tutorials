NAME=txtest3
DEPS=baudgen.v divider.v

#-------------------------------------------------------
#-- Objetivo por defecto: hacer simulacion y sintesis
#-------------------------------------------------------
all: clean sint load

#----------------------------------------------
#-- make sim
#----------------------------------------------
#-- Objetivo para hacer la simulacion del
#-- banco de pruebas
#----------------------------------------------
sim: clean $(NAME)_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la sintetis completa
#- y dejar el diseno listo para su grabacion en
#- la FPGA
#-----------------------------------------------
sint: clean $(NAME).bin

#-------------------------------
#-- Compilacion y simulacion
#-------------------------------
$(NAME)_tb.vcd: $(NAME).v $(NAME)_tb.v

	#-- Compilar
	iverilog -o $(NAME).out $(NAME).v $(DEPS) $(NAME)_tb.v

	#-- Simular
	./$(NAME).out

	#-- Crear VCD
	vvp $(NAME).out

	#-- Ver visualmente la simulacion con gtkwave
	gtkwave $(NAME)_tb.vcd

#------------------------------
#-- Sintesis completa
#------------------------------
$(NAME).bin: $(NAME).v $(NAME).pcf

	#-- Sintesis
	/usr/local/bin/yosys -p "synth_ice40 -blif $(NAME).blif" $(NAME).v $(DEPS)

	#-- Place & route
	arachne-pnr -d 1k -p $(NAME).pcf $(NAME).blif -o $(NAME).txt

	#-- Generar binario final, listo para descargar en fgpa
	icepack $(NAME).txt $(NAME).bin

#-- Cargar en FPGA
load:
	iceprog $(NAME).bin

clean:
	#-- Clean everything
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
