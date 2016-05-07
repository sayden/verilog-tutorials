#!/bin/bash

iverilog -o encoder priority_encoder.v priority_encoder_tb.v
vvp encoder
gtkwave dump.vcd
