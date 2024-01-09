# Alpha 7 - Ethereum Classic Node Configuration and Setup Script

# Constants
$TARGET_NODES = 50
$API_URL = 'https://api.etcnodes.org/peers?all=true'
$NODES_FILE = "found_nodes.txt"
$BATCH_FILE = "START_GETH_FAST_NODE.bat"
$CONFIG_FILE = "config.toml"
$STATIC_NODES_FILE = "STATIC_NODES.json"
$LOG_FILE = "script_log.txt"
$CUSTOM_PORT_FILE = "custom port detected.txt"

function Log-Message {
    param ([string]$message)
    Add-Content -Path $LOG_FILE -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): $message"
    Write-Host $message
}

function Read-CurrentPort {
    $locations = @(
        "C:\Program Files (x86)\ETCMC ETC NODE LAUNCHER 1920x1080\ETCMC_GUI\ETCMC_GETH",
        "C:\Program Files (x86)\ETCMC ETC NODE LAUNCHER 1024x600\ETCMC_GUI\ETCMC_GETH",
        "D:\"
    )

    foreach ($location in $locations) {
        $batchFilePath = Join-Path $location $BATCH_FILE
        if (Test-Path $batchFilePath) {
            $batchFileContent = Get-Content $batchFilePath
            foreach ($line in $batchFileContent) {
                if ($line -match "--port\s+(['""]?\d+['""]?)(\s|\^|$)") {
                    $currentPort = $matches[1] -replace '[^0-9]'
                    $customPortFilePath = Join-Path (Split-Path -Parent $PSCommandPath) $CUSTOM_PORT_FILE
                    Set-Content -Path $customPortFilePath -Value $currentPort
                    Log-Message "Current port ($currentPort) detected and saved to $customPortFilePath"
                    return $currentPort, $location
                }
            }
        }
    }
    Log-Message "No START_GETH_FAST_NODE.bat file found in the specified locations."
    return $null, $null
}

function Fetch-AllNodes {
    try {
        Log-Message "Fetching all nodes..."
        $response = Invoke-WebRequest -Uri $API_URL
        $nodes = $response.Content | ConvertFrom-Json
        $filteredNodes = $nodes | Where-Object { $_.enode -and $_.enode -match ":303" }
        Log-Message "Found $($filteredNodes.Count) nodes after filtering"
        return $filteredNodes | Select-Object -First $TARGET_NODES -ExpandProperty enode
    }
    catch {
        Log-Message "Error fetching nodes: $_"
        return @()
    }
}

function Write-Files {
    param (
        [string[]]$nodes,
        [string]$customPort,
        [string]$destinationDir
    )

    Log-Message "Writing configuration and batch files..."
    $batchContent = "title Ethereum Classic Node`ngeth --config config.toml --classic --syncmode `"snap`" --cache 1024 --metrics --http --http.addr `"localhost`" --http.port `"8545`" --http.corsdomain `"*`" --ws --ws.addr `"localhost`" --ws.port `"8546`" --ws.origins `"*`" --datadir `".\gethDataDirFastNode`" --identity `"ETCMCgethNode`" --port $customPort --bootnodes "

    foreach ($node in $nodes) {
        $batchContent += $node + ","
    }

    $batchContent += " console`n"

    # Adding quotes to each node and joining them with a comma and newline
    $quotedNodes = $nodes | ForEach-Object { "`"$_`"" }
    $joinedNodes = $quotedNodes -join ",`n"
    $configContent = "[Node.P2P]`nStaticNodes = [`n" + $joinedNodes + "`n]`n"

    Set-Content -Path (Join-Path $destinationDir $BATCH_FILE) -Value $batchContent
    Set-Content -Path (Join-Path $destinationDir $CONFIG_FILE) -Value $configContent
    Log-Message "Configuration and batch files written to $destinationDir"
}



function Move-FilesAndRename {
    param ([string]$destinationDir)

    Log-Message "Checking for STATIC_NODES.json file..."
    $staticNodesPath = Join-Path $destinationDir $STATIC_NODES_FILE
    if (Test-Path $staticNodesPath) {
        $backupName = $STATIC_NODES_FILE -replace "\.json$", "bak.json"
        Rename-Item -Path $staticNodesPath -NewName $backupName -ErrorAction SilentlyContinue
        Log-Message "STATIC_NODES.json file renamed to $backupName"
    } else {
        Log-Message "No STATIC_NODES.json file found to rename."
    }
}

function Open-FirewallPorts {
    Log-Message "Opening firewall ports..."
    $ports = @(30303..30399 + 8545, 8546, 8547, 8551, 55802)
    foreach ($port in $ports) {
        netsh advfirewall firewall add rule name="Open TCP Port $port" dir=in action=allow protocol=TCP localport=$port | Out-Null
        netsh advfirewall firewall add rule name="Open UDP Port $port" dir=in action=allow protocol=UDP localport=$port | Out-Null
    }
    Log-Message "Firewall ports opened."
}

# Main Script Execution

Log-Message "Alpha 7 Script execution started."
$currentPort, $portLocation = Read-CurrentPort
if (-not $currentPort) {
    Log-Message "No existing port found. Exiting script."
    return
}

$allNodes = Fetch-AllNodes
if ($allNodes.Count -eq 0) {
    Log-Message "No suitable nodes found."
    return
}

if ($allNodes.Count -lt $TARGET_NODES) {
    Log-Message "Warning: Found less than $TARGET_NODES nodes. Proceeding with $($allNodes.Count) nodes."
}

Write-Files -nodes $allNodes -customPort $currentPort -destinationDir $portLocation
Move-FilesAndRename -destinationDir $portLocation
Open-FirewallPorts
Log-Message "Script execution completed. Check the output files and firewall settings."
Log-Message "Summary of actions: Port read, batch and config files created, STATIC_NODES.json processed, firewall ports opened."
Log-Message "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
