#ifndef _MULTIHAT_
#define _MULTIHAT_

#include <stdio.h>
#include "ap_int.h"

typedef ap_int<130> data_130;
typedef ap_int<128> data_128;
typedef ap_int<80> data_80;
typedef ap_int<32> data_32;
typedef ap_uint<17> data_17;
typedef ap_uint<16> data_16;
typedef ap_uint<1> data_bit;

data_128 LFSR();
data_16 hat_mul1(data_32);
data_16 hat_mul2(data_32);
data_16 hat_mul3(data_32);
data_16 hat_mul4(data_32);
data_16 adder_block(data_16, data_16, data_16, data_16);
data_16 multihat();

#endif
