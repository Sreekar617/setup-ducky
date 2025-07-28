$mnt = Mount-DiskImage -ImagePath "./wpilib.iso" -PassThru
$isodrive = ($mnt | Get-Volume).DriveLetter + ":" # this feels hacky but i bet everything feels hacky in powershell
New-Item -ItemType Directory -Path ".\wpilib" -Force 
Copy-Item -Path "$isodrive\*" -Destination "./wpilib" -Recurse -Force
# execute wpilib.exe
./wpilib/wpilib.exe
# configure your own installation bozo