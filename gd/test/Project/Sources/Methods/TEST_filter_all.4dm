//%attributes = {}
$path:=File:C1566("/RESOURCES/logo-summit.png").platformPath
READ PICTURE FILE:C678($path;$image)

C_COLLECTION:C1488($filters)

$filters:=New collection:C1472
$filters.push(New object:C1471("filter";IMG_FILTER_NEGATE))
$filters.push(New object:C1471("filter";IMG_FILTER_GRAYSCALE))
$filters.push(New object:C1471("filter";IMG_FILTER_EDGEDETECT))
$filters.push(New object:C1471("filter";IMG_FILTER_EMBOSS))
$filters.push(New object:C1471("filter";IMG_FILTER_GAUSSIAN_BLUR;"radius";1;"sigma";1))
$filters.push(New object:C1471("filter";IMG_FILTER_MEAN_REMOVAL))
$filters.push(New object:C1471("filter";IMG_FILTER_SMOOTH;"weight";1))
$filters.push(New object:C1471("filter";IMG_FILTER_CONTRAST;"contrast";1))
$filters.push(New object:C1471("filter";IMG_FILTER_BRIGHTNESS;"brightness";1))
$filters.push(New object:C1471("filter";IMG_FILTER_SCATTER;"sub";1;"plus";1))
$filters.push(New object:C1471("filter";IMG_FILTER_PIXELATE;"size";5;"mode";1))
$filters.push(New object:C1471("filter";IMG_FILTER_COLORIZE;"red";5;"green";1;"blue";1;"alpha";1))
$filters.push(New object:C1471("filter";IMG_FILTER_CONVOLUTION;"div";1;"offset";1;"matrix";New collection:C1472(\
New collection:C1472(1;1;1);New collection:C1472(1;1;1);New collection:C1472(1;1;1))))

$result:=GD Filter ($image;$filters)

$image:=$result.image

SET PICTURE TO PASTEBOARD:C521($image)
