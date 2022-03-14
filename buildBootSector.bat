set boot-sector="src\asm\bootSector.asm"
set bios-print-str="src\asm\BiosPrintString.asm"
set out-name="out\bootSector.bin"
set nasm="nasm-2.15.05\nasm.exe"


%nasm% %boot-sector% -f bin -o %out-name%
pause -> nul