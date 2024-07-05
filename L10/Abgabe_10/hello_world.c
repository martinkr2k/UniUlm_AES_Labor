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
#include <sys/time.h>
#include <sys/alt_irq.h>
#include "altera_avalon_performance_counter.h"


/*
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
	PERF_RESET(PERFORMANCE_COUNTER_0_BASE);
	PERF_START_MEASURING(PERFORMANCE_COUNTER_0_BASE);

	// VARIABLES
	alt_u32 messageInput = 0;
	alt_u8 polynomInput = 0;
	struct timeval tv1, tv2;

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
	gettimeofday(&tv1, NULL);
	PERF_BEGIN(PERFORMANCE_COUNTER_0_BASE, 1);
	alt_u32 result = crc_checker(messageInput, polynomInput);
	PERF_END(PERFORMANCE_COUNTER_0_BASE, 1);
	PERF_STOP_MEASURING(PERFORMANCE_COUNTER_0_BASE);
	gettimeofday(&tv2, NULL);

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
	printf("Time: %f \n", (double) (tv2.tv_usec - tv1.tv_usec) / 100000 + (double) (tv2.tv_sec - tv1.tv_sec));

	perf_print_formatted_report(PERFORMANCE_COUNTER_0_BASE, ALT_CPU_FREQ, 1, "crc_checker");

  return 0;
}
*/



int main()
{

	printf("Hello from Nios II new new!\n");

	struct timeval tv1, tv2;
	alt_u32 message = 0;
	alt_u32 polynom = 0;
	PERF_RESET(PERFORMANCE_COUNTER_0_BASE);
	PERF_START_MEASURING(PERFORMANCE_COUNTER_0_BASE);

	scanf("%x", &message);
	scanf("%x", &polynom);

	printf("\nMessage: ");
	for (int i = 31; i >= 0; --i) {
		if (message & (1 << i)) {
			printf("1");
		} else {
			printf("0");
		}
	}

	printf("\nPolynom: ");
	for (int i = 31; i >= 0; --i) {
		if (polynom & (1 << i)) {
			printf("1");
		} else {
			printf("0");
		}
	}
	printf("\n");

	printf("\n-----\n");

	IOWR(CRC_0_BASE, 0, message);
	gettimeofday(&tv1, NULL);
	IOWR(CRC_0_BASE, 1, polynom);
	PERF_BEGIN(PERFORMANCE_COUNTER_0_BASE, 1);
	//int t0 = clock();

	alt_u32 result;
	alt_u32 result1;

	do {
	   result1 = IORD(CRC_0_BASE, 1);
	//	printf(".");
	} while (result1 & (1<<0));

	PERF_END(PERFORMANCE_COUNTER_0_BASE, 1);
	PERF_STOP_MEASURING(PERFORMANCE_COUNTER_0_BASE);

	result = IORD(CRC_0_BASE, 0);
	//int t1 = clock();
	gettimeofday(&tv2, NULL);
	//int time_diff_ms = (t1 - t0)*1000;

	printf("\nResult:  ");
	for (int i = 31; i >= 0; --i) {
		if (result & (1 << i)) {
			printf("1");
		} else {
			printf("0");
		}
	}

	printf("\nResult:  ");
	for (int i = 31; i >= 0; --i) {
		if (result1 & (1 << i)) {
			printf("1");
		} else {
			printf("0");
		}
	}

	printf("\n");
	perf_print_formatted_report(PERFORMANCE_COUNTER_0_BASE, ALT_CPU_FREQ, 1, "crc_checker");
	//printf("Time: %f \n", (double) (tv2.tv_usec - tv1.tv_usec) / 100000 + (double) (tv2.tv_sec - tv1.tv_sec));
	return 0;
}

