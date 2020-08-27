//%attributes = {"invisible":true,"preemptive":"incapable"}
C_OBJECT:C1216($j;$o)

$t:=Get text from pasteboard:C524

$j:=JSON Parse:C1218($t)

For each ($o;$j.commands)
	
	$o.threadSafe:=True:C214
	
End for each 

SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($j;*))