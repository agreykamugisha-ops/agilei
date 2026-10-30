Set-Location $PSScriptRoot
$nodeExe = "D:\node.exe"
$npmCli = "D:\node_modules\npm\bin\npm-cli.js"
$env:NODE_ENV = "production"
& $nodeExe $npmCli run build
& $nodeExe $npmCli start
