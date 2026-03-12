Write-Output "Iniciando script de teste para usuário..."

$user = $env:USERNAME
$desktop = [Environment]::GetFolderPath("Desktop")

$filePath = "$desktop\teste-agente.txt"

try {

Write-Output "Criando arquivo de teste..."

$content = "Script executado com sucesso pelo agente."
$content += "`nUsuario: $user"
$content += "`nData: $(Get-Date)"

Set-Content -Path $filePath -Value $content

Write-Output "Arquivo criado em: $filePath"

exit 0

}
catch {

Write-Output "Erro ao criar arquivo: $_"
exit 1

}
