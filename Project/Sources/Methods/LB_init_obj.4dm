//%attributes = {}
//  LB_init_obj (text)
// $1: list box object name
// Written by: Kirk as Designer, Created: 03/07/20, 17:14:25
// ------------------
// Purpose: init a listbox object on Form
// { name:        listbox object name
//   data:        collection or entity selection 
//   curItem:     currently selected item
//   pos:         position (row) of selected item
//   selected:    collection of selected items
//   dataSource:  name of primary table (entity selections)
//   queryStr:    query to establish .data
//   config:      LB_config object
// }
//==========================================

C_TEXT:C284($1; $name)
C_OBJECT:C1216($0; $lb_obj)

ASSERT:C1129(Count parameters:C259=1)  //  yell at dev
$name:=$1

// these have to do with the list box object on the form
$lb_obj:=New object:C1471(\
"data"; Null:C1517; \
"curItem"; Null:C1517; \
"pos"; 0; \
"selected"; Null:C1517; \
"name"; $name)

// --------------------------------------------------------
$0:=$lb_obj