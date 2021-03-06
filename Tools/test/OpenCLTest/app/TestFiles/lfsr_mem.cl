@repeat_inner=128
@repeat_outer=16
@delay_inner=0
@out_size=16777216
@global=4194304
@local=128

__kernel void testkernel(const int loop1, const int loop2, const int count,__global float* out) {
	int reg[15];
	reg[0]=get_local_id(0);
	reg[1]=0;
	reg[2]=0xAAAAAAAA;
	reg[3]=0xCCCCCCCC;
	reg[4]=0xF0F0F0F0;
	reg[5]=0xFF00FF00;
	reg[6]=0xFFFF0000;
	for (int i=1;i<loop1;i++)
	{				   
		reg[14]=reg[14] ^ reg[13];    
		reg[13]=reg[13] ^ reg[12];    
		reg[12]=reg[12] ^ reg[11];    
		reg[11]=reg[11] ^ reg[10];    
		reg[10]=reg[10] ^ reg[9];    
		reg[9]=reg[9] ^ reg[8];    
		reg[8]=reg[8] ^ reg[7];    
		reg[7]=reg[7] ^ reg[6];    
		reg[6]=reg[6] ^ reg[5];    
		reg[5]=reg[5] ^ reg[4];    
		reg[4]=reg[4] ^ reg[3];    
		reg[3]=reg[3] ^ reg[2];    		
		reg[2]=reg[2] ^ reg[1];    
		reg[1]=reg[1] ^ reg[0];    
		reg[0]=reg[0] ^ reg[14];
	}	
	out[get_global_id(0)]=(float)reg[0];
}

