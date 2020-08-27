//%attributes = {}
$path:=File:C1566("/RESOURCES/logo-summit.png").platformPath
READ PICTURE FILE:C678($path;$image)

CREATE THUMBNAIL:C679($image;$image;256;256)

$angles:=New collection:C1472
For ($angle;0;360;6)
	$angles.push($angle)
End for 

$status:=GD Rotate ($image;$angles)

$folder:=Folder:C1567(fk data folder:K87:12).folder("rotate")
$folder.delete(Delete with contents:K24:24)
$folder.create()

For each ($image;$status.images)
	$picture:=$image.image
	WRITE PICTURE FILE:C680($folder.file(String:C10($image.angle)+".png").platformPath;$picture)
End for each 

SHOW ON DISK:C922($folder.platformPath)