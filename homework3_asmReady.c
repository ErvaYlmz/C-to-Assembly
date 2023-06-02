
#include <stdio.h>
#define charOffset 60
#define minimumDistance 4
#define abs(z) (z>0 ? (z) : -(z))

int main(){
	int radius=15;
	int size= 2*radius +1;

	int y=0;
loop:
	{	int deltaY=abs(y - radius);
	
		int x=0;
		inner_loop:
			{	int deltaX= abs(x-radius);
				int dist= deltaX+deltaY;

				if(dist>minimumDistance){
					putchar(dist + charOffset);}
				else{
					putchar(' ');}
			}x++;

			if(x<size){
				goto inner_loop;
			}
			putchar(10);
	}
	y++;

	if(y<size){
		goto loop;
	} 
return 0;}
