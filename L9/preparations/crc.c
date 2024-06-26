/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "system.h"
#include "alt_types.h"
#include "io.h"
#include "altera_avalon_pio_regs.h"

// Define Offsets (eventuell anpassen!)
#define CRC_BASE 0x00000000
#define CRC_ADR_IN_OFFSET 0
#define CRC_ADR_OUT_OFFSET 4
#define CRC_ADRESS_OFFSET 8
#define CRC_WRITE_OFFSET 12

void crc_write_polynom (alt_u32 polynom) {
    IOWR(CRC_BASE, CRC_ADRESS_OFFSET, 1);
    IOWR(CRC_BASE, CRC_ADR_IN_OFFSET, polynom);
    IOWR(CRC_BASE, CRC_WRITE_OFFSET, 1);
    IOWR(CRC_BASE, CRC_WRITE_OFFSET, 0);
}

void crc_write_message (alt_u32 message) {
    IOWR(CRC_BASE, CRC_ADRESS_OFFSET, 0);
    IOWR(CRC_BASE, CRC_ADR_IN_OFFSET, message);
    IOWR(CRC_BASE, CRC_WRITE_OFFSET, 1);
    IOWR(CRC_BASE, CRC_WRITE_OFFSET, 0);
}

alt_u32 crc_read_polynom () {
    alt_u32 tmp;
    IOWR(CRC_BASE, CRC_ADRESS_OFFSET, 1);
    IODR(CRC_BASE, CRC_ADR_OUT_OFFSET, tmp);
    return tmp;
}

alt_u32 crc_read_message () {
    alt_u32 tmp;
    IOWR(CRC_BASE, CRC_ADRESS_OFFSET, 0);
    IODR(CRC_BASE, CRC_ADR_OUT_OFFSET, tmp);
    return tmp;
}



int main()
{
	// handle Input
    alt_u32 message;
    alt_u32 polynom;


    // write Input
    crc_write_message(message);
    crc_write_polynom(polynom);

    // read Output
    bool processing_complete = false;

	while(!processing_complete) {            
        alt_u32 crc_processing = crc_read_polynom();

        if (!(crc_processing & 0x1)) {
            processing_complete = true;
        }     
	}

    alt_u32 crc_result = crc_read_message();

    // handle Output

	return 0;
}