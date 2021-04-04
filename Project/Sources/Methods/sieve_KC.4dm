//%attributes = {}
/*----------------------------------------------------
 Keith,  4/2/2021, 10:33:06
 ----------------------------------------------------
 Method: Sieve
 - 
----------------------------------------------------*/
C_LONGINT:C283($1; $i; $pos; $nSize; $size; $ms; $passes)
C_TEXT:C284($text)

// Setup
$size:=$1  //  1000000

ARRAY LONGINT:C221($a; $size)
ARRAY BOOLEAN:C223($b; $size)

For ($i; 1; $size)
	$a{$i}:=$i
End for 

$passes:=0
$pos:=3
$nSize:=Trunc:C95($size/3; 0)

// Calculate
$ms:=Milliseconds:C459
While ($nSize>$pos)
	For ($i; $pos; $nSize; 2)
		$b{$a{$pos}*$i}:=True:C214
	End for 
	$pos:=$pos+2
	$nSize:=Trunc:C95($size/$a{$pos}; 0)
	$passes:=$passes+1
End while 
$ms:=Milliseconds:C459-$ms




// Count 
If (False:C215)
	$count:=Count in array:C907($b; False:C215)
Else 
	$count:=1
	//$text:="2 "
	For ($i; 3; $size; 2)
		If (Not:C34($b{$i}))
			//$text:=$text+String($a{$i})+" "
			$count:=$count+1
		End if 
	End for 
End if 

$0:=New object:C1471(\
"method"; Current method name:C684; \
"ms"; $ms; \
"nPrimes"; $count)


// ALERT("Passes="+String($passes)+"  ms="+String($ms)+Char(13)+"#Primes between 1 and "+String($size)+" = "+String($count)+Char(13)+$text)