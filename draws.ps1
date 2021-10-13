Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$size = 100

function moveTo(){
    param ($xPos, $yPos)
    Write-Host $xPos, $yPos
    [Windows.Forms.Cursor]::Position = "$xPos, $yPos"
    Start-Sleep -Milliseconds 2
}


Write-Host "start position"
$x = 500
$y = 500
MoveTo -xPos $x -yPos $y


#wait for left click and hold
Write-Host "Reposition then hold down left button now"
Start-Sleep -Seconds 3
$x = [Windows.Forms.Cursor]::Position.X
$y = [Windows.Forms.Cursor]::Position.Y



Write-Host "top"
$x += 700
MoveTo -xPos $x -yPos $y



Write-Host "end"
$xOff = $x
$yOff = $y + $size
For ($i=180; $i -ge -0; $i-=2){
    $xCirc = [Math]::Sin($i * ([Math]::PI/180))
    $x = [Int](($xCirc * $size) + $xOff)
    $yCirc = [Math]::Cos($i * ([Math]::PI/180))
    $y = [Int](($yCirc * $size) + $yOff)
    MoveTo -xPos $x -yPos $y
}


Write-Host "bottom"
$x -= 500
MoveTo -xPos $x -yPos $y



Write-Host "first"
$xOff = $x
$yOff = $y + $size
For ($i=180; $i -ge -100; $i-=2){
    $xCirc = [Math]::Sin($i * ([Math]::PI/180))
    $x = [Int](($xCirc * $size) + $xOff)
    $yCirc = [Math]::Cos($i * ([Math]::PI/180))
    $y = [Int](($yCirc * $size) + $yOff)
    MoveTo -xPos $x -yPos $y
}

Write-Host "second"
$xOff = $x - $size
$yOff = $y
For ($i=90; $i -ge -180; $i-=2){
    $xCirc = [Math]::Sin($i * ([Math]::PI/180))
    $x = [Int](($xCirc * $size) + $xOff)
    $yCirc = [Math]::Cos($i * ([Math]::PI/180))
    $y = [Int](($yCirc * $size) + $yOff)
    MoveTo -xPos $x -yPos $y
}
