Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true

$colors = @([System.Drawing.Color]::Red, [System.Drawing.Color]::Black)
$index = 0

while ($true) {
    $form.BackColor = $colors[$index]
    $form.Refresh()
    $index = 1 - $index
    Start-Sleep -Seconds 1
}
