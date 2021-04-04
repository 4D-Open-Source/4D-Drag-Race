//%attributes = {}


C_LONGINT:C283($1)
C_LONGINT:C283($id; $i; $window)
C_TEXT:C284($procName)

$procName:=Current method name:C684

Case of 
	: (Count parameters:C259=0)
		$id:=Process number:C372($procName)
		
		If ($id=0)
			$id:=New process:C317(Current method name:C684; 0; $procName; Current process:C322)
		Else 
			BRING TO FRONT:C326($id)
		End if 
		
	: (Count parameters:C259=1)  //     new process
		
		$window:=Open form window:C675("input_dlog"; Plain form window:K39:10)
		
		If (Is compiled mode:C492)
			SET WINDOW TITLE:C213("The Main Event - >>> COMPILED <<<")
		Else 
			SET WINDOW TITLE:C213("The Main Event - INTERPRETED!!")
		End if 
		
		DIALOG:C40("input_dlog")
		
		
End case 
