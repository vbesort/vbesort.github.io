$files = Get-ChildItem -Path ".\" -Filter *.png -Recurse
$json = $files | ForEach-Object {
    if ($_.Name.Length -ge 6 -and $_.Name[5] -eq '1') {
        [ordered]@{
            filename = $_.Name
            topic = "misc"
	    answer = "A"
        }
    } else {
        [ordered]@{
            filename = $_.Name
            topic = "misc"
            answer = $_.Name
        }
    }
} | ConvertTo-Json -Depth 10
$json | Out-File "filenames.json"
