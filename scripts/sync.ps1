# Re-pulls the latest copies from the live sources on this machine into this repo.
# Run this, review the git diff, then commit + push to keep the knowledge hub current.

$repoRoot = Split-Path -Parent $PSScriptRoot

$vaults = Get-ChildItem -Path "C:\Users\adumi\OneDrive\Documents" -Directory | Where-Object { $_.Name -like "*Vault*" }
foreach ($v in $vaults) {
    $target = Join-Path "$repoRoot\vaults" $v.Name
    robocopy $v.FullName $target /E /MIR /NFL /NDL /NJH /NJS /NC /NS /NP | Out-Null
}
Write-Host "Synced $($vaults.Count) vaults"

robocopy "C:\Users\adumi\.claude\skills" "$repoRoot\skills" /E /MIR /NFL /NDL /NJH /NJS /NC /NS /NP | Out-Null
Write-Host "Synced skills"

robocopy "C:\Users\adumi\.claude\projects\C--Users-adumi-OneDrive-Desktop-claude\memory" "$repoRoot\memory" /E /MIR /NFL /NDL /NJH /NJS /NC /NS /NP | Out-Null
Write-Host "Synced memory"

Copy-Item "C:\Users\adumi\.claude\CLAUDE.md" "$repoRoot\config\CLAUDE.md" -Force
Write-Host "Synced config"

Write-Host "`nDone. Review with: git -C `"$repoRoot`" status"
