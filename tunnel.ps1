Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'
$form.Opacity = 0.8

$graphics = $form.CreateGraphics()

$centerX = [int]($form.Width / 2)
$centerY = [int]($form.Height / 2)
$maxRadius = [math]::Min($centerX, $centerY)

for ($r = 0; $r -lt $maxRadius; $r += 10) {
    $graphics.DrawEllipse([System.Drawing.Pens]::White, $centerX - $r, $centerY - $r, $r * 2, $r * 2)
    Start-Sleep -Milliseconds 50
    $form.Refresh()
}

Start-Sleep -Seconds 5
$form.Close()
