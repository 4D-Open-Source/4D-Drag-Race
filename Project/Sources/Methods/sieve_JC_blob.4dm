//%attributes = {}
  // ----------------------------------------------------
  // User name (OS): James Crate
  // Date and time: 03/29/21, 20:17:18
  // ----------------------------------------------------
  // Method: sieve_JC_blob
  // ----------------------------------------------------
C_BLOB:C604($blob)
C_LONGINT:C283($1;$i;$limit;$numPrimes;$factor;$q)
C_REAL:C285($startMS;$calcMS)
  // ----------------------------------------------------
$limit:=$1  //  1000000

SET BLOB SIZE:C606($blob;$limit+1;1)

$startMS:=Milliseconds:C459

$factor:=2
$q:=Square root:C539($limit)

  //%R-
While ($factor<$q)
	  //  is this factor available?
	If ($blob{$factor}=1)
		$numPrimes:=$numPrimes+1
		For ($i;$factor*2;$limit;$factor)
			$blob{$i}:=0
		End for 
	End if 
	$factor:=$factor+1
End while 

For ($i;$factor+1;$limit;2)
	$numPrimes:=$numPrimes+$blob{$i}
End for 
  //%R-

$calcMS:=Milliseconds:C459

$0:=New object:C1471(\
"method";Current method name:C684;\
"ms";$calcMS-$startMS;\
"nPrimes";$numPrimes)

