//%attributes = {}
$path:=File:C1566("/RESOURCES/logo-summit.png").platformPath
READ PICTURE FILE:C678($path;$image)

CREATE THUMBNAIL:C679($image;$image;256;256)

  //remove alpha
CONVERT PICTURE:C1002($image;".bmp")
CONVERT PICTURE:C1002($image;".png")

$angles:=New collection:C1472
For ($angle;0;360;6)
	$angles.push($angle)
End for 

$status:=GD Rotate ($image;$angles)

$images:=$status.images.extract("image")

$status:=GD Animate ($images;1)

If ($status.success)
	
	$folder:=Folder:C1567(fk data folder:K87:12).folder("animate")
	$folder.delete(Delete with contents:K24:24)
	$folder.create()
	
	$image:=$status.image
	
	WRITE PICTURE FILE:C680($folder.file("test.gif").platformPath;$image)
	
	SHOW ON DISK:C922($folder.platformPath)
	
End if 