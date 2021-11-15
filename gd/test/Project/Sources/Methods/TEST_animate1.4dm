//%attributes = {}
$files:=Folder:C1567(fk desktop folder:K87:19).folder("1").files()

$files:=$files.orderBy("fullName")

C_OBJECT:C1216($file)
$images:=New collection:C1472
For each ($file;$files)
	READ PICTURE FILE:C678($file.platformPath;$image)
	$images.push($image)
End for each 


$status:=GD Animate ($images;1)

If ($status.success)
	
	$folder:=Folder:C1567(fk desktop folder:K87:19).folder("animate")
	  //$folder.delete(Delete with contents)
	  //$folder.create()
	
	$image:=$status.image
	
	WRITE PICTURE FILE:C680($folder.file("test.gif").platformPath;$image)
	
	SHOW ON DISK:C922($folder.platformPath)
	
End if 