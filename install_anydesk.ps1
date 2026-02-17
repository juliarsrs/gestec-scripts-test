$anydeskPath = "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"

Write-Output "Verificando instalação do AnyDesk..."

if (Test-Path $anydeskPath) {
    Write-Output "AnyDesk já está instalado."
    exit 0
}

Write-Output "AnyDesk não encontrado. Baixando instalador..."

$installerUrl = "https://download.anydesk.com/AnyDesk.exe"
$tempInstaller = "$env:TEMP\AnyDesk.exe"

try {
    Invoke-WebRequest -Uri $installerUrl -OutFile $tempInstaller -UseBasicParsing
}
catch {
    Write-Output "Falha ao baixar AnyDesk."
    exit 1
}

Write-Output "Instalando AnyDesk..."

Start-Process $tempInstaller `
    -ArgumentList "--install C:\Program Files (x86)\AnyDesk --start-with-win --silent" `
    -Wait

Write-Output "Instalação concluída."

exit 0