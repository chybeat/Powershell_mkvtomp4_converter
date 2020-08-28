    param($mkvPath)
<#
Written by Camilo Salzar (PC Bogota, Andy, ChyBeat)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

Requerimientos:

 Descargar los archivos binarios para Windows desde FFMPEG (No source code)
 
    - Página oficial
      https://ffmpeg.org/download.html

    - Descarga de los binarios
      https://ffmpeg.zeranoe.com/builds

Pasos a seguir

A. Descomprimir en cualquier carpeta el archivo "ffmpeg.exe" (unico requerido)

B. Copiar el script mkvtomp4.ps1 en la misma carpeta donde se extrajo ffmpeg.exe

C. Dar click derecho sobre el archivo mkvtomp4.ps1 y seleccionar "Ejecutar con powershell"

D. Colocar la carpeta de origen de los archivos .MKV o la ruta completa del archivo para conversión
   Si se coloca la carpeta (sin el archivo) se convierten todos los archivos

   Es posible realizar la conversión desde linea de comandos de la siguiente forma

   .\mkvtomp4 d:\videos             (Lo cual convertirá todos los videos dentro de la carpeta d:\videos)
   .\mkvtomp4 d:\videos\file.mkv    (Convierte y crea el archivo file.mkv a file.mp4)

E. Enjoy!
#>

function switch-vidFormat{
    param([string]$mkvFile)
    
    $file = Split-Path $mkvFile -Leaf -Resolve
    $parent= Split-Path $mkvFile -Parent

    $text_result = .\ffmpeg.exe -i $mkvFile 2>&1 | Out-string
    $text_result = $text_result.Replace("`n","")

    
    if($text_result -like "*Input #0, matroska*"){
        Write-Host -NoNewline "`nConvirtiendo archivo "
        write-Host -NoNewline -BackgroundColor Black $mkvFile
        Write-Host ", porfavor espere..."

        $destFile = $parent + "\" + $file.Substring(0, ($file.Length - 3)) + "mp4"
        if(Test-Path $destFile -PathType Leaf){
            $timestamp = Get-Date -Format o | ForEach-Object { $_ -replace ":", "." }
            $destFile = $destFile.Substring(0, ($destFile.Length - 4)) + "_" + $timestamp + ".mp4"
        }
        .\ffmpeg.exe -loglevel fatal -hide_banner -i $mkvFile -codec copy $destFile
        Write-Host "`n Archivo $destFile creado.`n`n"
    }else{
        Write-Host "´nEl archivo $mkvFile no parece ser un archivo MKV válido."
        return
    }
}


#E:\Videos\Social media\Youtube\PC Bogota\Intro\mkv

cls
Write-Host '
    Written by Camilo Salazar on Aug-28-2020
    
    Copyright 2020
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
'

# Buscar el archivo ffmpeg.exe (puede estar en carpeta bin)

if(!(Test-path -Path "$PSScriptRoot\ffmpeg.exe" -PathType Leaf)){
    Write-host "`nNo se encuentra el archivo ffmpeg.exe"
    Write-host "Revisa en la web de ffmpeg para más información`n"
    Write-host -ForegroundColor Green "https://ffmpeg.org/`n"
    pause

}else{
    # pedir el ingreo de la carpeta u archivo de origen si no se colocó al inicio
    if ($mkvPath -eq $null){
        $mkvPath = read-host "Ingresa la carpeta donde se encuentra los archivos .MKV"
    }

    #verificar archivos .MKV en el origen
    if(Test-path -Path $mkvPath -PathType Leaf){
        #al pasar como solo archivo la comprobaciópn se hace en la función switch-vidFormat
        switch-vidFormat($mkvPath)
    }else{
        Get-ChildItem -Path $mkvPath -Recurse -Include *.mkv | % {
            switch-vidFormat($mkvPath + "\" +$_.Name)
        }
        #g:\pcbogota


    }

    #Verificar si el archivo mp4 fue satisfactoriamente convertido
}

Write-host 'Terminado!'
pause
