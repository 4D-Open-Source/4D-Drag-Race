/*  input_dlog ()
 Created by: Kirk as Designer, Created: 04/04/21, 10:28:50
 ------------------
 Purpose: 

*/


C_TEXT:C284($ui_msg)
C_TEXT:C284($menu; $result; $objectName_t)

$objectName_t:=String:C10(FORM Event:C1606.objectName)

Case of 
	: (Form event code:C388=On Load:K2:1)  //  catches all objects
		Form:C1466.n:=1000000
		
		Form:C1466.results_LB:=LB_init_obj("results_LB")
		
		
	: ($objectName_t="btn_go")
		OBJECT SET VISIBLE:C603(*; "pic_1"; True:C214)
		OBJECT SET VISIBLE:C603(*; "results_LB"; False:C215)
		
		CALL WORKER:C1389("drag_race"; "sieve_drag_race"; Form:C1466.n; Current form window:C827)
		
		
		
End case 

If ($ui_msg#"")
	ALERT:C41($ui_msg)
End if 