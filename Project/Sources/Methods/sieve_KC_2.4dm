//%attributes = {}
//  sieve_KC_2

C_LONGINT:C283($1; $i; $pos; $nSize; $size; $ms; $passes)
C_TEXT:C284($text)

// Setup
$size:=$1  // Num(Request("Prime from 1 to "; "1000"))

ARRAY LONGINT:C221($a; $size)
ARRAY BOOLEAN:C223($b; $size)

$passes:=0
$pos:=3
$nSize:=Trunc:C95($size/3; 0)

// Calculate
$ms:=Milliseconds:C459
While ($nSize>=$pos)
	For ($i; $pos; $nSize; 2)
		$b{$pos*$i}:=True:C214
	End for 
	$pos:=$pos+2
	$nSize:=Trunc:C95($size/$pos; 0)
	$passes:=$passes+1
End while 
$ms:=Milliseconds:C459-$ms

// Count 
$count:=1
$top:=$size-100
$text:="2 "
For ($i; 3; $size; 2)
	If (Not:C34($b{$i}))
		$count:=$count+1
		
		If ($i<50) | ($i>$top)
			$text:=$text+String:C10($i)+" "
		End if 
		
	End if 
End for 


$0:=New object:C1471(\
"method"; Current method name:C684; \
"ms"; $ms; \
"nPrimes"; $count)


//ALERT("Passes="+String($passes)+"  ms="+String($ms)+Char(13)+"#Primes between 1 and "+String($size)+" = "+String($count)+Char(13)+$text)

