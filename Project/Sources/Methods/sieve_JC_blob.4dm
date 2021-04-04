//%attributes = {}
// ----------------------------------------------------
// User name (OS): James Crate
// Date and time: 03/29/21, 20:17:18
// ----------------------------------------------------
// Method: sieve_JC_blob
// ----------------------------------------------------
C_BLOB:C604($bits)
C_LONGINT:C283($1; $i; $limit; $targetNumPrimes; $factor; $q)
C_REAL:C285($startMS; $initMS; $calcMS; $generateMS)
// ----------------------------------------------------

$limit:=$1  //  1000000
$targetNumPrimes:=78498
$startMS:=Milliseconds:C459

// init
SET BLOB SIZE:C606($bits; $limit+1; 1)
$bits{1}:=0
For ($i; 2; $limit; 2)
	$bits{$i}:=0
End for 

$initMS:=Milliseconds:C459
// calculate the rest
$factor:=3
$q:=Square root:C539($limit)

While ($factor<$q)
	//  is this factor available?
	If ($bits{$factor}=1)
		For ($i; $factor*2; $limit; $factor)
			$bits{$i}:=0
		End for 
	End if 
	$factor:=$factor+2
End while 
$calcMS:=Milliseconds:C459


// list primes
ARRAY LONGINT:C221($primes; $targetNumPrimes)
C_LONGINT:C283($foundPrimes)
For ($i; 1; $limit)
	If ($bits{$i}=1)
		$foundPrimes:=$foundPrimes+1
		If ($foundPrimes<$targetNumPrimes)
			$primes{$foundPrimes}:=$i
		End if 
	End if 
End for 

$0:=New object:C1471(\
"method"; Current method name:C684; \
"ms"; $calcMS-$initMS; \
"nPrimes"; Size of array:C274($primes))



/*
$countMS:=Milliseconds
ALERT("init: "+String($initMS-$startMS)+"ms, calc: "+String($calcMS-$initMS)+"ms, "+\
"count: "+String($countMS-$calcMS)+"ms, total: "+String($countMS-$startMS)+"ms")
ASSERT($foundPrimes=$targetNumPrimes; "Found "+String($foundPrimes)+"primes, expected "+String($targetNumPrimes))
*/