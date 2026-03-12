Write-Output "Iniciando teste de download..."

$url = "https://example.com/arquivo-que-nao-existe.ps1"
$destino = "$env:TEMP\teste-download.ps1"

try {

Write-Output "Tentando baixar arquivo..."

Invoke-WebRequest $url -OutFile $destino -ErrorAction Stop

Write-Output "Download concluído."

exit 0

}
catch {

Write-Output "Erro no download: $_"

exit 1

}
