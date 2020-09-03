//%attributes = {}
$path:=File:C1566("/RESOURCES/logo-summit.png").platformPath

$path:=Folder:C1567(fk desktop folder:K87:19).file("screenshot.png").platformPath

READ PICTURE FILE:C678($path;$image)

PICTURE PROPERTIES:C457($image;$width;$height)

$angle:=90
$newWidth:=Abs:C99($width*Cos:C18(Degree:K30:2*$angle))+Abs:C99($height*Sin:C17(Degree:K30:2*$angle))
$newHeight:=Abs:C99($width*Sin:C17(Degree:K30:2*$angle))+Abs:C99($height*Cos:C18(Degree:K30:2*$angle))

$angles:=New collection:C1472
$angles.push(New object:C1471("angle";$angle;"width";$newWidth;"height";$newHeight))  //explicit (1)
$angles.push(New object:C1471("angle";$angle))  //automatic (2)
$angles.push(New object:C1471("angle";$angle;"width";$width;"height";$height))  //keep original (3)

$status:=GD Rotate ($image;$angles)

$folder:=Folder:C1567(fk data folder:K87:12).folder("rotate")
$folder.delete(Delete with contents:K24:24)
$folder.create()

$i:=1
For each ($image;$status.images)
	$picture:=$image.image
	WRITE PICTURE FILE:C680($folder.file(String:C10($i)+".png").platformPath;$picture)
	$i:=$i+1
End for each 

SHOW ON DISK:C922($folder.platformPath)