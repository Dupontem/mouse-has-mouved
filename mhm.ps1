Add-Type -Namespace User32 -Name Functions -MemberDefinition @'
[DllImport("user32.dll")];
public static extern void mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);
'@
$anim=@("#.........","##........","###.......","####......","#####.....","######....","#######...",
"########..","#########.")
Clear-Host ; while ($true) {
  [console]::CursorVisible = $false
  Write-Host "`b`r########## Mouse event" -NoNewline -ForegroundColor Yellow; Start-Sleep -m 1500
  [User32.Functions]::mouse_event(0x0001, 0, 0, 0, 0)  # MOUSEEVENTF_MOVE = 0x0001
  $anim | % { Write-Host "`b`r$_ Waiting     " -NoNewline -ForegroundColor Yellow ; Start-Sleep -m 1500 }
}