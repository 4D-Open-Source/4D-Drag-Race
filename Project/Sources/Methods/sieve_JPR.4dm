//%attributes = {}
//Prime number generator
//Using the Erathosthene's method, set up during a time when computers
//were _slow_ 
//The idea is to never divide nor multiply, but just to remove the non prime numbers
//The numbers left by the method are prime.

C_LONGINT:C283($1; $max)
C_OBJECT:C1216($0)
C_REAL:C285($startMillis; $endMillis; $found)
C_LONGINT:C283($i; $last; $step; $limit; $count)

$max:=$1

BEEP:C151  //Go !!!
ARRAY BOOLEAN:C223($ar_OK; 0)  //Prepare the array.
ARRAY LONGINT:C221($ar_Nb; 0)  //Array to use to display the numbers

$start:=Current time:C178  //Stopwatch start. Man can use  Milliseconds
$startMillis:=Milliseconds:C459

//The booleans (1 bit per boolean) will be set to true if the number is not prime
$last:=2+2  //Last number that has been used
$step:=2  //Step for this number
$flag:=True:C214  //End of Job flag
$limit:=($max^0.5)+1  //The last prime number cannot be greater then square root of the limit + 1
$count:=0

ARRAY BOOLEAN:C223($ar_OK; $max)  //Reset the array to the correct size

//The 2 next lines are not necessary because 4D initialize the array with False
$ar_OK{1}:=False:C215  //1 is a prime number...
$ar_OK{2}:=False:C215  //... 2 also ...

//This loop can be almost completely debugged, and we can remove 
//the Range Checking for this part. The following line does the job...
//%R-
While ($flag)
	For ($i; $last; $max; $step)  //We step and mark the multiples of $last
		$ar_OK{$i}:=True:C214
		$count:=$count+1
	End for 
	
	$i:=$step+1  //We go to next seed
	
	While ($ar_OK{$i})  //and it should not be prime
		$i:=$i+1
	End while   //so it is the next prime number, and we can remove its multiples.
	
	$last:=$i*2
	$step:=$i
	$flag:=($i<$limit)  //We stop if the limit is reached
End while 
//%R+    

//Now we have to reset the Range Checking option thru the previous line
$found:=Count in array:C907($ar_OK; False:C215)
$endMillis:=Milliseconds:C459

BEEP:C151

$0:=New object:C1471(\
"method"; Current method name:C684; \
"ms"; $endMillis-$startMillis; \
"nPrimes"; $found)

