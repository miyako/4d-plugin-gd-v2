//%attributes = {}
$path:=File:C1566("/RESOURCES/logo-summit.png").platformPath
READ PICTURE FILE:C678($path;$image)

C_COLLECTION:C1488($filters)

$filters:=New collection:C1472
$filters.push(New object:C1471("filter";IMG_FILTER_NEGATE))

$result:=GD Filter ($image;$filters)

$image:=$result.image

SET PICTURE TO PASTEBOARD:C521($image)