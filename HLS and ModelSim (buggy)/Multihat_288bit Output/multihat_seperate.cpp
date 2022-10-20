#include <stdio.h>
#include <ap_int.h>

typedef ap_int<130> data_130;
typedef ap_int<128> data_128;
typedef ap_int<80> data_80;
typedef ap_int<32> data_32;
typedef ap_int<17> data_17;
typedef ap_int<16> data_16;
typedef ap_int<1> data_bit;


data_128 LFSR();
data_16 hat_mul1(data_32);
data_16 hat_mul2(data_32);
data_16 hat_mul3(data_32);
data_16 hat_mul4(data_32);

data_16 adder_block(data_16, data_16, data_16, data_16);
data_80 multihat();

data_80 multihat() {
    data_128 lfsr_value;
    data_16 hat_mul_out1, hat_mul_out2, hat_mul_out3, hat_mul_out4, out;

    lfsr_value = LFSR();
    hat_mul_out1 = hat_mul1(lfsr_value.range(31, 0));
    hat_mul_out2 = hat_mul2(lfsr_value.range(63, 32));
    hat_mul_out3 = hat_mul3(lfsr_value.range(95, 64));
    hat_mul_out4 = hat_mul4(lfsr_value.range(127, 96));
    out = adder_block(hat_mul_out1, hat_mul_out2, hat_mul_out3, hat_mul_out4);
    data_80 testOutput = (out, hat_mul_out1, hat_mul_out2, hat_mul_out3, hat_mul_out4);
    return testOutput;
}

data_16 adder_block(data_16 in0, data_16 in1, data_16 in2, data_16 in3) {
    data_17 s00, s01, s10;

    s00 = (in0[15], in0) + (in1[15], in1);
    s01 = (in2[15], in2) + (in3[15], in3);
    s10 = (s00[16], s00.range(16, 1)) + (s01[16], s01.range(16, 1));

    return s10.range(16, 1);
}

data_16 hat_mul1 (data_32 in_32) {
    static data_16 z = 0;
    static data_16 z1 = 0;
    static data_16 z2 = 0;

    data_bit c = (z1[14] ^ z1[15]) & (!(z1[13] ^ z1[14]));
    data_bit d = (in_32[27] ^ z1[15]) & (!(in_32[28] ^ in_32[27]));

    // update z2
    z2.range(12, 0) = z1(12, 0);
    z2[15] = z1[15];
    if (c == 1) {
        if (d == 1) {
            z2.range(14, 13) = in_32.range(30, 29);
        } else {
            z2.range(14, 13) = in_32.range(28, 27);
        }
    } else {
        z2.range(14, 13) = z1.range(14, 13);
    }

    data_bit a = (in_32[20] | in_32[21] | in_32[22]) & in_32[23];
    data_bit b = in_32[24] & in_32[25] & in_32[26];

    // update z1
    z1.range(13, 0) = z.range(13, 0);
    z1[15] = z[15];
    if (b == 1) {
        z1[14] = z[14];
    } else {
        z1[14] = z[15];
    }

    // update z
    z.range(12, 0) = in_32.range(12, 0);
    z[15] = in_32[15];

    if (a == 0) {
        z.range(14, 13) = in_32.range(14, 13);
    } else {
        z.range(14, 13) = (in_32[15], in_32[15]);
    }

    return z2;
}

data_16 hat_mul2(data_32 in_32) {
    static data_16 z = 0;
    static data_16 z1 = 0;
    static data_16 z2 = 0;

    data_bit c = (z1[14] ^ z1[15]) & (!(z1[13] ^ z1[14]));
    data_bit d = (in_32[27] ^ z1[15]) & (!(in_32[28] ^ in_32[27]));

    // update z2
    z2.range(12, 0) = z1(12, 0);
    z2[15] = z1[15];
    if (c == 1) {
        if (d == 1) {
            z2.range(14, 13) = in_32.range(30, 29);
        } else {
            z2.range(14, 13) = in_32.range(28, 27);
        }
    } else {
        z2.range(14, 13) = z1.range(14, 13);
    }

    data_bit a = (in_32[20] | in_32[21] | in_32[22]) & in_32[23];
    data_bit b = in_32[24] & in_32[25] & in_32[26];

    // update z1
    z1.range(13, 0) = z.range(13, 0);
    z1[15] = z[15];
    if (b == 1) {
        z1[14] = z[14];
    } else {
        z1[14] = z[15];
    }

    // update z
    z.range(12, 0) = in_32.range(12, 0);
    z[15] = in_32[15];

    if (a == 0) {
        z.range(14, 13) = in_32.range(14, 13);
    } else {
        z.range(14, 13) = (in_32[15], in_32[15]);
    }

    return z2;
}

data_16 hat_mul3(data_32 in_32) {
    static data_16 z = 0;
    static data_16 z1 = 0;
    static data_16 z2 = 0;

    data_bit c = (z1[14] ^ z1[15]) & (!(z1[13] ^ z1[14]));
    data_bit d = (in_32[27] ^ z1[15]) & (!(in_32[28] ^ in_32[27]));

    // update z2
    z2.range(12, 0) = z1(12, 0);
    z2[15] = z1[15];
    if (c == 1) {
        if (d == 1) {
            z2.range(14, 13) = in_32.range(30, 29);
        } else {
            z2.range(14, 13) = in_32.range(28, 27);
        }
    } else {
        z2.range(14, 13) = z1.range(14, 13);
    }

    data_bit a = (in_32[20] | in_32[21] | in_32[22]) & in_32[23];
    data_bit b = in_32[24] & in_32[25] & in_32[26];

    // update z1
    z1.range(13, 0) = z.range(13, 0);
    z1[15] = z[15];
    if (b == 1) {
        z1[14] = z[14];
    } else {
        z1[14] = z[15];
    }

    // update z
    z.range(12, 0) = in_32.range(12, 0);
    z[15] = in_32[15];

    if (a == 0) {
        z.range(14, 13) = in_32.range(14, 13);
    } else {
        z.range(14, 13) = (in_32[15], in_32[15]);
    }

    return z2;
}

data_16 hat_mul4(data_32 in_32) {
    static data_16 z = 0;
    static data_16 z1 = 0;
    static data_16 z2 = 0;

    data_bit c = (z1[14] ^ z1[15]) & (!(z1[13] ^ z1[14]));
    data_bit d = (in_32[27] ^ z1[15]) & (!(in_32[28] ^ in_32[27]));

    // update z2
    z2.range(12, 0) = z1(12, 0);
    z2[15] = z1[15];
    if (c == 1) {
        if (d == 1) {
            z2.range(14, 13) = in_32.range(30, 29);
        } else {
            z2.range(14, 13) = in_32.range(28, 27);
        }
    } else {
        z2.range(14, 13) = z1.range(14, 13);
    }

    data_bit a = (in_32[20] | in_32[21] | in_32[22]) & in_32[23];
    data_bit b = in_32[24] & in_32[25] & in_32[26];

    // update z1
    z1.range(13, 0) = z.range(13, 0);
    z1[15] = z[15];
    if (b == 1) {
        z1[14] = z[14];
    } else {
        z1[14] = z[15];
    }

    // update z
    z.range(12, 0) = in_32.range(12, 0);
    z[15] = in_32[15];

    if (a == 0) {
        z.range(14, 13) = in_32.range(14, 13);
    } else {
        z.range(14, 13) = (in_32[15], in_32[15]);
    }

    return z2;
}
data_128 LFSR() {
	static data_130 regs("0b0000010010001101000101011001111000100110111101111011111010001000010101010010101100101111010101010110100100011010001101101011110101", 2);
	data_130 next;
	data_128 out;

	next[0] = regs[7] ^ regs[10];
	next[1] = regs[8] ^ regs[11];
	next[2] = regs[9] ^ regs[12];
	next[3] = regs[10] ^ regs[13];
	next[4] = regs[11] ^ regs[14];
	next[5] = regs[12] ^ regs[15];
	next[6] = regs[13] ^ regs[16];
	next[7] = regs[14] ^ regs[17];
	next[8] = regs[15] ^ regs[18];
	next[9] = regs[16] ^ regs[19];
	next[10] = regs[17] ^ regs[20];
	next[11] = regs[18] ^ regs[21];
	next[12] = regs[19] ^ regs[22];
	next[13] = regs[20] ^ regs[23];
	next[14] = regs[21] ^ regs[24];
	next[15] = regs[22] ^ regs[25];
	next[16] = regs[23] ^ regs[26];
	next[17] = regs[24] ^ regs[27];
	next[18] = regs[25] ^ regs[28];
	next[19] = regs[26] ^ regs[29];
	next[20] = regs[27] ^ regs[30];
	next[21] = regs[28] ^ regs[31];
	next[22] = regs[29] ^ regs[32];
	next[23] = regs[30] ^ regs[33];
	next[24] = regs[31] ^ regs[34];
	next[25] = regs[32] ^ regs[35];
	next[26] = regs[33] ^ regs[36];
	next[27] = regs[34] ^ regs[37];
	next[28] = regs[35] ^ regs[38];
	next[29] = regs[36] ^ regs[39];
	next[30] = regs[37] ^ regs[40];
	next[31] = regs[38] ^ regs[41];
	next[32] = regs[39] ^ regs[42];
	next[33] = regs[40] ^ regs[43];
	next[34] = regs[41] ^ regs[44];
	next[35] = regs[42] ^ regs[45];
	next[36] = regs[43] ^ regs[46];
	next[37] = regs[44] ^ regs[47];
	next[38] = regs[45] ^ regs[48];
	next[39] = regs[46] ^ regs[49];
	next[40] = regs[47] ^ regs[50];
	next[41] = regs[48] ^ regs[51];
	next[42] = regs[49] ^ regs[52];
	next[43] = regs[50] ^ regs[53];
	next[44] = regs[51] ^ regs[54];
	next[45] = regs[52] ^ regs[55];
	next[46] = regs[53] ^ regs[56];
	next[47] = regs[54] ^ regs[57];
	next[48] = regs[55] ^ regs[58];
	next[49] = regs[56] ^ regs[59];
	next[50] = regs[57] ^ regs[60];
	next[51] = regs[58] ^ regs[61];
	next[52] = regs[59] ^ regs[62];
	next[53] = regs[60] ^ regs[63];
	next[54] = regs[61] ^ regs[64];
	next[55] = regs[62] ^ regs[65];
	next[56] = regs[63] ^ regs[66];
	next[57] = regs[64] ^ regs[67];
	next[58] = regs[65] ^ regs[68];
	next[59] = regs[66] ^ regs[69];
	next[60] = regs[67] ^ regs[70];
	next[61] = regs[68] ^ regs[71];
	next[62] = regs[69] ^ regs[72];
	next[63] = regs[70] ^ regs[73];
	next[64] = regs[71] ^ regs[74];
	next[65] = regs[72] ^ regs[75];
	next[66] = regs[73] ^ regs[76];
	next[67] = regs[74] ^ regs[77];
	next[68] = regs[75] ^ regs[78];
	next[69] = regs[76] ^ regs[79];
	next[70] = regs[77] ^ regs[80];
	next[71] = regs[78] ^ regs[81];
	next[72] = regs[79] ^ regs[82];
	next[73] = regs[80] ^ regs[83];
	next[74] = regs[81] ^ regs[84];
	next[75] = regs[82] ^ regs[85];
	next[76] = regs[83] ^ regs[86];
	next[77] = regs[84] ^ regs[87];
	next[78] = regs[85] ^ regs[88];
	next[79] = regs[86] ^ regs[89];
	next[80] = regs[87] ^ regs[90];
	next[81] = regs[88] ^ regs[91];
	next[82] = regs[89] ^ regs[92];
	next[83] = regs[90] ^ regs[93];
	next[84] = regs[91] ^ regs[94];
	next[85] = regs[92] ^ regs[95];
	next[86] = regs[93] ^ regs[96];
	next[87] = regs[94] ^ regs[97];
	next[88] = regs[95] ^ regs[98];
	next[89] = regs[96] ^ regs[99];
	next[90] = regs[97] ^ regs[100];
	next[91] = regs[98] ^ regs[101];
	next[92] = regs[99] ^ regs[102];
	next[93] = regs[100] ^ regs[103];
	next[94] = regs[101] ^ regs[104];
	next[95] = regs[102] ^ regs[105];
	next[96] = regs[103] ^ regs[106];
	next[97] = regs[104] ^ regs[107];
	next[98] = regs[105] ^ regs[108];
	next[99] = regs[106] ^ regs[109];
	next[100] = regs[107] ^ regs[110];
	next[101] = regs[108] ^ regs[111];
	next[102] = regs[109] ^ regs[112];
	next[103] = regs[110] ^ regs[113];
	next[104] = regs[111] ^ regs[114];
	next[105] = regs[112] ^ regs[115];
	next[106] = regs[113] ^ regs[116];
	next[107] = regs[114] ^ regs[117];
	next[108] = regs[115] ^ regs[118];
	next[109] = regs[116] ^ regs[119];
	next[110] = regs[117] ^ regs[120];
	next[111] = regs[118] ^ regs[121];
	next[112] = regs[119] ^ regs[122];
	next[113] = regs[120] ^ regs[123];
	next[114] = regs[121] ^ regs[124];
	next[115] = regs[122] ^ regs[125];
	next[116] = regs[123] ^ regs[126];
	next[117] = regs[124] ^ regs[127];
	next[118] = regs[125] ^ regs[128];
	next[119] = regs[126] ^ regs[129];
	next[120] = regs[0];
	next[121] = regs[1];
	next[122] = regs[2];
	next[123] = regs[3];
	next[124] = regs[4];
	next[125] = regs[5];
	next[126] = regs[6];
	next[127] = regs[7];
	next[128] = regs[8];
	next[129] = regs[9];

    regs = next;
	out = regs.range(127, 0);
	return out;
}
