# Function to calculate SHA256 hash of a file
function Get-FileHashSHA256 {
    param (
        [string]$FilePath
    )
    $hasher = [System.Security.Cryptography.SHA256]::Create()
    try {
        $stream = [System.IO.File]::OpenRead($FilePath)
        $hash = $hasher.ComputeHash($stream)
        return ([BitConverter]::ToString($hash) -replace '-', '').ToLower()
    } finally {
        $stream.Close()
        $hasher.Dispose()
    }
}

# Prompt for directory path
$directoryPath = Read-Host -Prompt "Enter directory path to search for duplicates"

# Initialize hash table to store file hashes
$hashes = @{}

# Find and process files
Get-ChildItem -Path $directoryPath -Recurse -File | ForEach-Object {
    $filePath = $_.FullName
    Write-Host "Scanning $filePath"
    $fileHash = Get-FileHashSHA256 -FilePath $filePath

    if (-not $hashes.ContainsKey($fileHash)) {
        $hashes[$fileHash] = @($filePath)
    } else {
        $hashes[$fileHash] += $filePath
    }
}

# Prepare CSV log
$currentDateTime = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$csvFile = "duplicates_$currentDateTime.csv"
"Hash,File Paths" | Out-File -FilePath $csvFile

# Log and display duplicates
foreach ($hash in $hashes.GetEnumerator()) {
    if ($hash.Value.Count -gt 1) {
        foreach ($filePath in $hash.Value) {
            "$($hash.Key),$filePath" | Out-File -FilePath $csvFile -Append
            Write-Host "Duplicate: $filePath"
        }
    }
}

Write-Host "Results logged to $csvFile"
