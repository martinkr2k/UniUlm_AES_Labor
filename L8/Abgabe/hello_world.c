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
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"


alt_u32 crc_checker(alt_u32 message, alt_u8 polynom)
{

	alt_u32 result = message;

	for (int i = 31; i >= 7; i--)
	{
		if (result & (1 << i)) {
			result ^= (alt_u32)polynom << (i - 7);
		}
	}

	return result;
}



int main()
{
	printf("Hello from Nios II CRC CHECKER!\n");

	// VARIABLES
	alt_u32 messageInput = 0;
	alt_u8 polynomInput = 0;

	// READ INPUT
	printf("\nMESSAGE: ");

	scanf("%x", &messageInput);

	printf("\nPOLYNOM: ");

	scanf("%x", &polynomInput);

	printf("\nMessage: ");
	for (int i = 31; i >= 0; --i) {
		if (messageInput & (1 << i)) {
			printf("1");
		} else {
			printf("0");
		}
	}
	printf("\n");

	printf("Polynom: ");
	for (int i = 7; i >= 0; --i) {
		if (polynomInput & (1 << i)) {
			printf("1");
		} else {
			printf("0");
		}
	}
	printf("\n");

	alt_u32 result = crc_checker(messageInput, polynomInput);

	//printf("%lu\n");
	printf("Result:  ");
	for (int i = 31; i >= 0; --i) {
		if (result & (1 << i)) {
			printf("1");
		} else {
			printf("0");
		}
	}
	printf("\n");

  return 0;
}
