# Powershell_mkvtomp4_converter
Script to convert (copy) easily files from Mkv to Mp4 video codec/format

### Written by Camilo Salzar (PC Bogota, Andy, ChyBeat)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

#### Requirements:

Download binary files for Windows from FFmpeg (binaries!, not sorce code)
```Descargar los archivos binarios para Windows desde FFMPEG (No source code)```
 
- Home page / _Página oficial_
https://ffmpeg.org/download.html

- Binary files download / ```Descarga de los binarios```
https://ffmpeg.zeranoe.com/builds


#### How to use / _Pasos a seguir_

A. Unzip in any folder the file "ffmpeg.exe" (only required)
```Descomprimir en cualquier carpeta el archivo "ffmpeg.exe" (unico requerido)```

B. Copy (clone, download, unzip) "mkvtomp4.ps1" file to the same folder where extract "ffmpeg.exe" file
```Copiar (clonar, descargar descomprimir) el archivo "mkvtomp4.ps1" en la misma carpeta donde se extrajo ffmpeg.exe```

C. Right click on "mkvtomp4.ps1" file and select "Run with powershell"
```Dar click derecho sobre el archivo mkvtomp4.ps1 y seleccionar "Ejecutar con powershell```

D. When ask about source, set the source folder of .mkv file(s) or exact path of the mkv file to convert.
   If you write a path (whithout specify any file) all the files in te folder will be converted recusively
   
```
    Cuando se le pregunte escriba la carpeta de origen de los archivos .MKV o la ruta completa del archivo para conversión
    Si se coloca la carpeta (sin el archivo) se convierten todos los archivos de la carptea y subcarpetas
```

It's possible to make conversion using powershell command line:
```Es posible realizar la conversión desde linea de comandos de la siguiente forma```

   .\mkvtomp4.ps1 d:\videos             
  Converts all files inside D:\videos folder
  ```Lo cual convertirá todos los videos dentro de la carpeta d:\videos)```

  .\mkvtomp4 d:\videos\file.mkv
  Converts ONLY file.mkv and create file.mp4
  ```Convierte y crea el archivo file.mkv a file.mp4```

E. Enjoy!
