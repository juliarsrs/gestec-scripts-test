Write-Output "Iniciando script de criação de arquivo..."

try {

$user = $env:USERNAME
$documentsPath = [Environment]::GetFolderPath("MyDocuments")

$filePath = "$documentsPath\arquivo-feliz.txt"

Write-Output "Criando arquivo em: $filePath"

$content = @"
Olá $user!

Este arquivo foi criado pelo agente gestec.desk :)

Tenha um ótimo dia!

    :)
"@

Set-Content -Path $filePath -Value $content -Encoding UTF8

Write-Output "Arquivo criado com sucesso."

exit 0

}
catch {

Write-Output "Erro ao criar arquivo: $_"

exit 1

}
