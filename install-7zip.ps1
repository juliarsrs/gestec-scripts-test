$sevenZipPath = "C:\Program Files\7-Zip\7z.exe"

Write-Output "Verificando arquivo 7-Zip..."

if (Test-Path $sevenZipPath) {
    Write-Output "7-Zip já está instalado."
    exit 0
}

Write-Output "7-Zip não encontrado. Baixando instalador..."

$installerUrl = "https://www.7-zip.org/a/7z2301-x64.exe"
$tempInstaller = "$env:TEMP\7zip_setup.exe"

try {

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    Invoke-WebRequest $installerUrl -OutFile $tempInstaller -UseBasicParsing

}
catch {
    Write-Output "Falha ao baixar 7-Zip: $_"
    exit 1
}

if (-not (Test-Path $tempInstaller)) {
    Write-Output "Arquivo não encontrado após download."
    exit 1
}

Write-Output "Instalando 7-Zip..."

Start-Process -FilePath $tempInstaller -ArgumentList "/S" -Wait

Write-Output "Instalação concluída."

exit 0
