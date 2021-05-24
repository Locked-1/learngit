#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/time.h>
#include <unistd.h>
#include <sched.h>
#include <string.h>

#if defined(__QNX__)
# include <sys/neutrino.h>
# include <sys/syspage.h>
#else // defined(__QNX__)
# include <sys/prctl.h>
# include <sys/sysinfo.h>
#endif // defined(__QNX__)

#define ESC_START   "\033["
#define ESC_END     "\033[0m"
#define COLOR_ERR   "31;40;1m"
#define COLOR_WAN   "33;40;1m"
#define COLOR_INF   "32;40;1m"
#define COLOR_DBG   "36;40;1m"

#define MSG_DBG(format, args...) (printf( ESC_START COLOR_DBG "[%s]: " format ESC_END, __FUNCTION__, ##args))
#define MSG_INF(format, args...) (printf( ESC_START COLOR_INF "[%s]: " format ESC_END, __FUNCTION__, ##args))
#define MSG_WAN(format, args...) (printf( ESC_START COLOR_WAN "[%s]: " format ESC_END, __FUNCTION__, ##args))
#define MSG_ERR(format, args...) (printf( ESC_START COLOR_ERR "[%s]: " format ESC_END, __FUNCTION__, ##args))

void memcpy_test(int mode, int isSame);
int main(int argc,char** argv){
	MSG_INF("hi~\n");

	memcpy_test(1, 3);
	memcpy_test(1, 2);
	memcpy_test(1, 1);
	memcpy_test(1, 0);
	
	memcpy_test(2, 3);
	memcpy_test(2, 2);
	memcpy_test(2, 1);
	memcpy_test(2, 0);

	MSG_INF("bye~\n");

	return 0;
}

#ifndef SYSTEM_GET_TIMEUS_S64
        #include <sys/time.h>
        #define SYSTEM_GET_TIMEUS_S64() ({   struct timeval time_val;gettimeofday(&time_val, 0);   (long long int)(((long long int)time_val.tv_sec*1000000 + (long long int)time_val.tv_usec));   })
	//long long int tims_us = SYSTEM_GET_TIMEUS_S64();
#endif//SYSTEM_GET_TIMEUS_S64

void memcpy_test(int mode, int isSame) {
	MSG_DBG("%s, begin\n", __func__);

	int memsize = 1280 * 800 * 3;
	int cpysize = 1280 * 800 * 3;
	
	char sum = 0;
	char * mem00 = (char*)malloc(memsize);
	char * mem01 = (char*)malloc(memsize);
	char * mem02 = (char*)malloc(memsize);
	char * mem03 = (char*)malloc(memsize);
	char * mem04 = (char*)malloc(memsize);
	char * mem05 = (char*)malloc(memsize);
	char * mem06 = (char*)malloc(memsize);
	char * mem07 = (char*)malloc(memsize);
	char * mem08 = (char*)malloc(memsize);
	char * mem09 = (char*)malloc(memsize);
	char * mem10 = (char*)malloc(memsize);

	if(isSame != 2) {
		memset(mem00, 0x01, memsize);	memset(mem00, 0x11, memsize);
		memset(mem01, 0x02, memsize);	memset(mem01, 0x12, memsize);
		memset(mem02, 0x03, memsize);	memset(mem02, 0x13, memsize);
		memset(mem03, 0x04, memsize);	memset(mem03, 0x14, memsize);
		memset(mem04, 0x05, memsize);	memset(mem04, 0x15, memsize);
		memset(mem05, 0x06, memsize);	memset(mem05, 0x16, memsize);
		memset(mem06, 0x07, memsize);	memset(mem06, 0x17, memsize);
		memset(mem07, 0x08, memsize);	memset(mem07, 0x18, memsize);
		memset(mem08, 0x09, memsize);	memset(mem08, 0x19, memsize);
		memset(mem09, 0x0A, memsize);	memset(mem09, 0x1A, memsize);
		memset(mem10, 0x0B, memsize);	memset(mem10, 0x1B, memsize);

		if(isSame == 1) {
			memset(mem00, 0xFF, memsize);
			memset(mem01, 0xFF, memsize);
			memset(mem02, 0xFF, memsize);
			memset(mem03, 0xFF, memsize);
			memset(mem04, 0xFF, memsize);
			memset(mem05, 0xFF, memsize);
			memset(mem06, 0xFF, memsize);
			memset(mem07, 0xFF, memsize);
			memset(mem08, 0xFF, memsize);
			memset(mem09, 0xFF, memsize);
			memset(mem10, 0xFF, memsize);
		}
	}
	else if(isSame == 2) {
		memset(mem01, 0x02, memsize);	memset(mem01, 0x12, memsize);
		memset(mem02, 0x03, memsize);	memset(mem02, 0x13, memsize);
		memset(mem03, 0x04, memsize);	memset(mem03, 0x14, memsize);
		memset(mem04, 0x05, memsize);	memset(mem04, 0x15, memsize);
		memset(mem05, 0x06, memsize);	memset(mem05, 0x16, memsize);
		memset(mem06, 0x07, memsize);	memset(mem06, 0x17, memsize);
		memset(mem07, 0x08, memsize);	memset(mem07, 0x18, memsize);
		memset(mem08, 0x09, memsize);	memset(mem08, 0x19, memsize);
		memset(mem09, 0x0A, memsize);	memset(mem09, 0x1A, memsize);
		memset(mem10, 0x0B, memsize);	memset(mem10, 0x1B, memsize);
	}
	else if(isSame == 3) {
		memset(mem00, 0xFF, memsize);

		memset(mem01, 0x02, memsize);	memset(mem01, 0x12, memsize);
		memset(mem02, 0x03, memsize);	memset(mem02, 0x13, memsize);
		memset(mem03, 0x04, memsize);	memset(mem03, 0x14, memsize);
		memset(mem04, 0x05, memsize);	memset(mem04, 0x15, memsize);
		memset(mem05, 0x06, memsize);	memset(mem05, 0x16, memsize);
		memset(mem06, 0x07, memsize);	memset(mem06, 0x17, memsize);
		memset(mem07, 0x08, memsize);	memset(mem07, 0x18, memsize);
		memset(mem08, 0x09, memsize);	memset(mem08, 0x19, memsize);
		memset(mem09, 0x0A, memsize);	memset(mem09, 0x1A, memsize);
		memset(mem10, 0x0B, memsize);	memset(mem10, 0x1B, memsize);
	}
	

	long long int tims_us_0 = SYSTEM_GET_TIMEUS_S64();
	if(mode == 1) {
		memcpy(mem00, mem01, cpysize);sum+=mem00[0];
	}
	else if(mode == 2) {
		for(int Index = 0; Index < 10; Index++) {
			memcpy(mem00, mem01, cpysize);sum+=mem00[0];
			memcpy(mem00, mem02, cpysize);sum+=mem00[0];
			memcpy(mem00, mem03, cpysize);sum+=mem00[0];
			memcpy(mem00, mem04, cpysize);sum+=mem00[0];
			memcpy(mem00, mem05, cpysize);sum+=mem00[0];
			memcpy(mem00, mem06, cpysize);sum+=mem00[0];
			memcpy(mem00, mem07, cpysize);sum+=mem00[0];
			memcpy(mem00, mem08, cpysize);sum+=mem00[0];
			memcpy(mem00, mem09, cpysize);sum+=mem00[0];
			memcpy(mem00, mem10, cpysize);sum+=mem00[0];
			
		}
	}
	long long int tims_us_1 = SYSTEM_GET_TIMEUS_S64();

	MSG_DBG("%s, time = %lld, (%d,%lld,%lld)\n", __func__, tims_us_1 - tims_us_0, sum, tims_us_1, tims_us_0);

	MSG_DBG("%s, end\n", __func__);

#if 0
	free(mem00);
	free(mem01);
	free(mem02);
	free(mem03);
	free(mem04);
	free(mem05);
	free(mem06);
	free(mem07);
	free(mem08);
	free(mem09);
	free(mem10);
#endif

	return ;
}

