#include <stdio.h>

void write9digits(int number) {
	int digits = 100000000;
	
	int i=0, digit;
	
	if(number >=0){
		putchar(' ');
		goto loop;
	} 
	goto Else;
	
	Else:
		putchar('-');
        digits = -digits;
        goto loop;
        
    loop:
    	{
    		digit = (number / digits);
    		putchar(digit + 48);
        
        	number = number % digits;
        	digits /= 10;
		}
    	i++;
    	
    	if(i<9){
    		goto loop;
		} 
		goto n_Else;
    	
    	n_Else:
    		putchar(10);
}
int main(void){
	const int numberCount = 8;
    int numbers[] = {321762410, 9, 2943018, 0, 19371039, 18, -76241, -208424};
	int k=0;
	
	loop:
		{
			write9digits(numbers[k]);
		}
		k++;
		
		if(k<numberCount){
			goto loop;
		} goto t_Else;
		
		t_Else:
		return 0;	
	
}
