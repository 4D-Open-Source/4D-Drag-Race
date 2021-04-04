Class constructor
	This:C1470.rawbits:=Null:C1517  //  storage for sieve
	This:C1470.sieveSize:=0  //  upper limit
	
	//  historical data of max # primes for each upper limit
	This:C1470.primeCounts:=New object:C1471(\
		"10"; 4; \
		"100"; 25; \
		"1000"; 168; \
		"10000"; 1229; \
		"100000"; 9592; \
		"1000000"; 78498; \
		"10000000"; 5761455)
	
	// --------------------------------------------------------
Function __init__($limit : Integer)
	
	This:C1470.sieveSize:=$limit
	This:C1470.rawbits:=New collection:C1472().resize(This:C1470.sieveSize; True:C214)
	This:C1470.rawbits[0]:=False:C215
	This:C1470.rawbits[1]:=False:C215
	
	For ($i; 4; This:C1470.sieveSize; 2)
		This:C1470.rawbits[$i]:=False:C215
	End for 
	
Function runSieve($n : Integer)
	var $0 : Object
	var $factor; $ms; $i : Integer
	var $q : Real
	
	$ms:=Milliseconds:C459
	
	This:C1470.__init__($n)
	$factor:=3
	$q:=Square root:C539(This:C1470.sieveSize)
	
	While ($factor<$q)
		//  is this factor available?
		If (Bool:C1537(This:C1470.rawbits[$factor]))
			// clear the multiples of it
			For ($i; $factor*2; This:C1470.sieveSize; $factor)
				This:C1470.rawbits[$i]:=False:C215
			End for 
		End if 
		
		$factor:=$factor+2
	End while 
	
	This:C1470.ms:=Milliseconds:C459-$ms
	
	$0:=New object:C1471(\
		"method"; Current method name:C684; \
		"ms"; This:C1470.ms; \
		"nPrimes"; This:C1470.countPrimes())
	
	If (This:C1470.primeCounts[String:C10(This:C1470.sieveSize)]#Null:C1517)
		ASSERT:C1129(This:C1470.countPrimes()<=This:C1470.primeCounts[String:C10(This:C1470.sieveSize)]; "You've got a bug in your code!")
	End if 
	
Function runSieveArray($n : Integer)
	var $factor; $ms; $i : Integer
	var $q : Real
	ARRAY BOOLEAN:C223($aBool; 0)
	
	$ms:=Milliseconds:C459
	
	This:C1470.__init__($n)
	
	COLLECTION TO ARRAY:C1562(This:C1470.rawbits.remove(0); $aBool)
	
	$factor:=3
	$q:=Square root:C539(This:C1470.sieveSize)
	
	While ($factor<$q)
		//  is this factor available?
		If ($aBool{$factor})
			// clear the multiples of it
			For ($i; $factor*2; This:C1470.sieveSize; $factor)
				$aBool{$i}:=False:C215
			End for 
		End if 
		
		$factor:=$factor+2
	End while 
	
	This:C1470.ms:=Milliseconds:C459-$ms
	
	ARRAY TO COLLECTION:C1563(This:C1470.rawbits; $aBool)
	
	$0:=New object:C1471(\
		"method"; Current method name:C684; \
		"ms"; This:C1470.ms; \
		"nPrimes"; This:C1470.countPrimes())
	
	If (This:C1470.primeCounts[String:C10(This:C1470.sieveSize)]#Null:C1517)
		ASSERT:C1129(This:C1470.countPrimes()<=This:C1470.primeCounts[String:C10(This:C1470.sieveSize)]; "You've got a bug in your code!")
	End if 
	
Function listPrimes->$primes : Collection
	$primes:=New collection:C1472()
	For ($i; 2; This:C1470.sieveSize)
		If (Bool:C1537(This:C1470.rawbits[$i]))
			$primes.push($i)
		End if 
	End for 
	
Function countPrimes->$n : Integer
	$n:=This:C1470.rawbits.countValues(True:C214)  //``