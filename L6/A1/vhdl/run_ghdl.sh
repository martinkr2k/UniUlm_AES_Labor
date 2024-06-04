#!/bin/bash

# Analyze the VHDL files with GHDL
ghdl -a --ieee=synopsys -fexplicit crc_checker.vhdl
if [ $? -ne 0 ]; then
    echo "GHDL analysis of crc_checker.vhdl failed."
    exit 1
fi

ghdl -a --ieee=synopsys -fexplicit crc_checker_tb.vhdl
if [ $? -ne 0 ]; then
    echo "GHDL analysis of crc_checker_tb.vhdl failed."
    exit 1
fi

# Elaborate the testbench
ghdl -e --ieee=synopsys -fexplicit crc_checker_tb
if [ $? -ne 0 ]; then
    echo "GHDL elaboration of crc_checker_tb failed."
    exit 1
fi

# Run the testbench
ghdl -r --ieee=synopsys -fexplicit crc_checker_tb
if [ $? -ne 0 ]; then
    echo "GHDL simulation of crc_checker_tb failed."
    exit 1
fi