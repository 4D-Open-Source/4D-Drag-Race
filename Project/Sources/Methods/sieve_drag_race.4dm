//%attributes = {}
/*  sieve_drag_race ()
 Created by: Kirk as Designer, Created: 04/04/21, 09:58:38
 ------------------
 Purpose: 

*/

var $1; $n; $2; $window : Integer
var $results_c : Collection
var $class_KB : cs:C1710.sieve_KB

$n:=$1  //  Num(Request("Enter the number to find primes for:"; "1,000,000"))
$window:=$2

If ($n>0)
	$results_c:=New collection:C1472()
	
	
	$results_c.push(sieve_JPR($n))
	
	$results_c.push(sieve_JC_blob($n))
	
	$results_c.push(sieve_KC($n))
	$results_c.push(sieve_KC_2($n))
	
	$class_KB:=cs:C1710.sieve_KB.new()
	$results_c.push($class_KB.runSieve($n))
	$results_c.push($class_KB.runSieveArray($n))
	
	// --------------------------------------------------------
	CALL FORM:C1391($window; "recieve_results"; $results_c)
	
End if 






