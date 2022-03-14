@echo off
set boot-sector="src\asm\bootSector.asm"
set bios-print-str="src\asm\BiosPrintString.asm"
set out-name="out\bootSector.bin"
set nasm="nasm-2.15.05\nasm.exe"

@echo on
%nasm% %boot-sector% -f bin -i "src/asm" -o %out-name%