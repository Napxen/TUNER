$ScriptBaseDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$TARGET_NODES = 50
$API_URL = 'https://api.etcnodes.org/peers?all=true'
$AllNodesFile = "reachablenodes.txt"
$FilteredNodesFile = "30303.txt"
$BATCH_FILE = "START_GETH_FAST_NODE.bat"
$CONFIG_FILE = "config.toml"
$LOG_FILE = "script_log.txt"
$CUSTOM_PORT_FILE = "custom port detected.txt"

# etcmc OFFICIAL BOOTLOADERS
$PROVIDED_ENODES = @(
"enode://9606793ccb2daa49e12c7a5e152544928c2ca9d5f610a2f213fbbb45d271fd94d1e18a2ded4bf43b319c1a7751ee9d95a749f04761b165fe53e1c1ed3260f29d@158.220.105.249:30303",
"enode://edcb4922dd61a10d32d4d73e1c8413a0c473154615af48865d2ac0841f82b1ff4b9dee0f6d5ccdd8d037a14ee0c63a178cab215f2f7eb9494faa8260b1cd266d@167.86.77.160:30303",
"enode://18210f25fb151dac37d972027d97b67b70abc8bb4a54e14df2072a7619103a9ed5e62873aa64fd4dfab98242f25eb42b424b44bf6008149520c02dae139f5df3@62.171.169.170:30303",
"enode://a68a4cae5e834d85054ad3aee5e4cb62d9a61642b6ef947fdfe77c6435a02c214f4538f116ded49d69f52b62b0af1e9177cf0e5ba10d276eeb12d07478ac0bf8@lethe-nka.dyndns.org:30303",
"enode://bcf3a38fe797c4ece48abbdb2206df4a569373e602e0dd43398a363a4ae9544254bc152acd98cd07b7fe628e81230a1872e6a46a652d74fe13cf8fc41472ef10@mainetz.ddns.net:30303",
"enode://1deb396330e927cca22620a7cd9cf51a9f92e84147ba83a21a09cdc07da0aab134006f78a0d30f8eeff96b8482666af440e7803b650c24e5857ec980490d3fa3@mainetz.ddns.net:30322",
"enode://7517174774317dd96c6f151d5d2866189b2e604c6d3a66c8f9d92269284fda1bf7ce8e6b078a168227540d4e090c95dbf0810ca26ddf4a957d886ffc48201615@67.188.2.34:30303",
"enode://56b09f4722f2e7145e837ae8975fbdfc2ba9fbdfd1c9fd7e2907aeacddd5daba8503bef21e6c26e915164a28b729158a4ec0c943d410c77d48f42e08eef0fb16@mainetz.ddns.net:30305",
"enode://fe3fce08d5a0dbbc240fc1d4dd79a63f325ac5194459c8d98a3816e1a7f3af1b30a02497c482c0184db07bc59ae7fc2f5640b5717a77c46e7503823828f34d16@bootnode.ddns.net:30303",
"enode://aba4fc3d856f3850f99ec9db7e45af43acad03c925c4c44e334fae14e32249c58cfc705cc54796d88bae5c9a99c7184768d518b2496cb105871bc74c12ecc9c8@217.122.83.122:30303",
"enode://9519990a042006719739daad199c4a363dc30a22d632ff3085a70a2ec7041ae78a4c0ba5851fe3b487d4e461c65e83c33c39d0c64a691b1e87cbaf07de64ad8d@217.122.83.122:30330",
"enode://792c4a3864fdd475de982f021ea24a145162474695c9f4d37c42f1eb22a715d72842bceed7fb238cfd8c9c9ff05d17b21eb497637a0921440f2369ebdb3973d9@217.122.83.122:30340",
"enode://10fb601da4043ff8cf6831c3ce3abf747a6cb8fb96bd4e07b1d2e0740a18ed205cb495aed4b536488c49891ddb581d5aaf5f9fbdd7abf1b4b0c980c819d1a80e@217.122.83.122:30350",
"enode://2c5cb2e331f56256696996a465709f2cae9fe0ca7358cf1a820ab61bcf233e7458b73d0e414e60bb2a0bf7d7ad1887c62ee5c333212cc64509b80b214274f079@197.234.147.16:30303",
"enode://d3a09543e3991a0bc2bf447017f719c56651905a434f6a95ca7219ea945f1493eb3ae4e8d3605ff82dd86d1e231111ff204201774b7ee78fe38394fe5f36cb06@185.157.26.107:30303",
"enode://5dbc6cfe4a31ac2d79e2052ede6194fd849af2adfe9f8f3d2eefa375bd7676dee717009db1caeedb21f2256f5bae69753a33b6c9b47107caf785899aaa4da5cd@72.75.209.137:30303",
"enode://4d30be4952784686e0deb7743cbaecf560eb050ef77a7bd6cbeddd248b091c65eff6fd84162a2f465a7b5af283923cea7428cd2da2ad658163ed647d7739dc0f@207.180.217.136:30303",
"enode://df3b5fb7210c9d4c595bf3d859f0efcb0533eb5509730c97449113b2cd7f88cb47b1aec62f66e2f1ecf95f7a0d1cf2f661cfae6ca760d41a9b0e070d7e6a76a1@115.85.88.10:30303",
"enode://8402bdf137de8fb47c51b06e855f160741bfb05cddaee056b05c1b1ff766c1f6fb523620b07ae02faf22cb6a5f241ab80315402771add76995e3b8540abe2bb3@foxcoinz.ddns.net:30303",
"enode://6bf6b5878193cb39ca8cb0beecbf2b3ef43c7aec2c9cce39c3a08f7ef6f05fbd4387d492bb913d0916a2a6afd14b12068739ece614864942691fa5befd4914f7@80.112.90.238:30303",
"enode://17a7c2c816f9086e9ec41a83dd714ac3f2746cc5dd8d0503e340e6c0e5a7f88598f1910390bfbe667b95383620786b7d4159517a82d4a05b6f16a7d09d02446c@94.132.52.132:30303",
"enode://c4d324003be91205b3d07de36a52abf033078e23ac231571eb99a08d7ceb9c8136316dd7d0a7de80c2c2e27f3544e50c994d950ef7a0e24cff06afa40cd2e6eb@77.247.90.134:30303",
"enode://b170973d769385e9a005b13374ff94c18cc9bb8c4605dbffb69f9317f0dcb1026152bf3b5b7d4ea6e19d5858cf8bf0c6caa4d16c88aa94970b40a8565b56831f@208.69.189.17:30303",
"enode://66dcb7b903255a117e614fe60b430c8131eb89f325f3ed7b7a313fe19bf2890195b29e9ca000bfad40a6f15a322c96b64ba1248a2d00f1d2a8e70aae944e947d@173.24.58.9:30303",
"enode://1c565055cecda11bbfcf8016eacb8ba624ebd2025d5448b52420a1dfdf6675af2d3ae0e96d19bc9b4ca8f0de2f7925113e2e94c2ee316658b585e52980b42651@bootdejota.ddns.net:30303"
)

function Log-Message {
    param ([string]$message)
    Add-Content -Path $LOG_FILE -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): $message"
    Write-Host $message
}

function Read-CurrentPort {
    $defaultPort = 30303
    $folderPaths = @(
        "\Program Files (x86)\ETCMC ETC NODE LAUNCHER 1920x1080\ETCMC_GUI\ETCMC_GETH",
        "\Program Files (x86)\ETCMC ETC NODE LAUNCHER 1024x600\ETCMC_GUI\ETCMC_GETH",
        "\ETCMC ETC NODE LAUNCHER 1920x1080\ETCMC_GUI\ETCMC_GETH",
        "\ETCMC ETC NODE LAUNCHER 1024x600\ETCMC_GUI\ETCMC_GETH"
    )

    $drives = [System.IO.DriveInfo]::GetDrives() | Where-Object { $_.DriveType -eq "Fixed" }
    foreach ($drive in $drives) {
        foreach ($folderPath in $folderPaths) {
            $fullPath = Join-Path $drive.Name $folderPath
            $batchFilePath = Join-Path $fullPath $BATCH_FILE
            Log-Message "Checking for batch file at: $batchFilePath"
            if (Test-Path $batchFilePath) {
                Log-Message "Found batch file at: $batchFilePath"
                $batchFileContent = Get-Content $batchFilePath
                $foundPort = $false
                foreach ($line in $batchFileContent) {
                    if ($line -match "--port\s+(['""]?\d+['""]?)") {
                        $currentPort = $matches[1] -replace '[^0-9]'
                        $customPortFilePath = Join-Path (Split-Path -Parent $PSCommandPath) $CUSTOM_PORT_FILE
                        Set-Content -Path $customPortFilePath -Value $currentPort
                        Log-Message "Current port ($currentPort) detected and saved to $customPortFilePath"
                        $foundPort = $true
                        return $currentPort, $fullPath
                    }
                }
                if (-not $foundPort) {
                    Log-Message "No port information found in batch file at: $batchFilePath. Defaulting to port $defaultPort."
                    return $defaultPort, $fullPath
                }
            } else {
                Log-Message "Batch file not found at: $batchFilePath"
            }
        }
    }
    Log-Message "No START_GETH_FAST_NODE.bat file found in the specified locations. Defaulting to port $defaultPort."
    return $defaultPort, $null
}



# Function to fetch and process nodes
function Fetch-And-Process-Nodes {
    try {
        # Fetch nodes
        $response = Invoke-WebRequest -Uri $API_URL -UseBasicParsing
        $nodes = $response.Content | ConvertFrom-Json

        # Check if we have nodes to process
        if ($nodes -and $nodes.Count -gt 0) {
            # Extract enode URLs
            $enodes = $nodes | ForEach-Object { $_.enode }
            Write-Host "Fetched $($enodes.Count) nodes."

            # Write all enodes to file
            $enodes | Out-File -FilePath $AllNodesFile
            Write-Host "Written all enodes to $AllNodesFile."

            # Filter for enodes containing port 30303 and write to another file
            $filteredEnodes = $enodes | Where-Object { $_ -match ":30303" }
            $filteredEnodes | Out-File -FilePath $FilteredNodesFile
            Write-Host "Written $($filteredEnodes.Count) filtered enodes to $FilteredNodesFile."
        } else {
            Write-Host "No nodes were found in the API response."
        }
    } catch {
        Write-Host "An error occurred: $_"
    }
}

function Write-Files {
    param (
        [string]$customPort,
        [string]$destinationDir
    )

    $staticNodesFilePath = "C:\TUNER6\30303.txt"
    $staticNodes = Get-Content $staticNodesFilePath

    # Prepare static nodes formatted string for the config
    $staticNodesFormatted = '"' + ($staticNodes -join '",' + "`n" + '"') + '"'

    # Use the provided ENODES directly from the script's global variable
    $bootstrapNodesFormatted = '"' + ($PROVIDED_ENODES -join '",' + "`n" + '"') + '"'

    # Construct batch and config content
    $batchContent = "title Ethereum Classic Node`ngeth --config `"config.toml`" --classic --syncmode `"snap`" --cache 1024 --metrics --http --http.addr `"localhost`" --http.api `"admin`" --http.port `"8545`" --http.corsdomain `"*`" --ws --ws.addr `"localhost`" --ws.port `"8546`" --ws.origins `"*`" --datadir `".\\gethDataDirFastNode`" --identity `"ETCMCgethNode`" --port $customPort console`n"
    
    $configContent = "# Ethereum Classic Node Configuration`n`n" +
    "[Eth]`n" +
    "# Network ID for Ethereum Classic`n" +
    "NetworkId = 61`n" +
    "# Sync mode (snap is faster for initial sync)`n" +
    'SyncMode = "snap"' + "`n" +
    "# Other optimization parameters`n" +
    "NoPruning = false`n" +
    "NoPrefetch = false`n" +
    "LightPeers = 100`n" +
    "UltraLightFraction = 75`n" +
    "# Cache size for database in MB`n" +
    "DatabaseCache = 1024`n`n" +
    "[Node]`n" +
    "# Data directory for the Ethereum node data`n" +
    'DataDir = ".\\gethDataDirFastNode"' + "`n" +
    "# Path to IPC file for inter-process communication`n" +
    'IPCPath = "geth.ipc"' + "`n" +
    "# HTTP configurations for the node`n" +
    'HTTPHost = "localhost"' + "`n" +
    "HTTPPort = 8545`n" +
    'HTTPCors = ["*"]' + "`n" +
    'HTTPVirtualHosts = ["localhost"]' + "`n" +
    "# Websocket configurations`n" +
    'WSHost = "localhost"' + "`n" +
    "WSPort = 8546`n`n" +
    "[Node.P2P]`n" +
    "# Peer-to-peer configurations`n" +
    "MaxPeers = 50`n" +
    "NoDiscovery = false`n`n" +
    "# Bootstrap nodes configuration`n" +
    "BootstrapNodes = [" + "`n" +
    $bootstrapNodesFormatted + "`n]" + "`n`n" +
    "# Static nodes configuration (from 30303.txt)`n" +
    "StaticNodes = [" + "`n" +
    $staticNodesFormatted + "`n]" + "`n"

    # Update the batch file and config.toml in the destination directory
    Set-Content -Path (Join-Path $destinationDir $BATCH_FILE) -Value $batchContent
    Set-Content -Path (Join-Path $destinationDir "config.toml") -Value $configContent
}

function Open-FirewallPorts {
    Log-Message "Checking and opening firewall ports if needed..."
    $ports = @(30303, 8545, 8546)
    foreach ($port in $ports) {
        # Define rule names for TCP and UDP
        $tcpRuleName = "Open TCP Port $port"
        $udpRuleName = "Open UDP Port $port"
        
        # Check for existing TCP rule
        $existingTCPRule = Get-NetFirewallRule -DisplayName $tcpRuleName -ErrorAction SilentlyContinue
        if (-not $existingTCPRule) {
            netsh advfirewall firewall add rule name="$tcpRuleName" dir=in action=allow protocol=TCP localport=$port | Out-Null
            Log-Message "TCP Port $port rule added to the firewall."
        } else {
            Log-Message "TCP Port $port rule already exists in the firewall."
        }
        
        # Check for existing UDP rule
        $existingUDPRule = Get-NetFirewallRule -DisplayName $udpRuleName -ErrorAction SilentlyContinue
        if (-not $existingUDPRule) {
            netsh advfirewall firewall add rule name="$udpRuleName" dir=in action=allow protocol=UDP localport=$port | Out-Null
            Log-Message "UDP Port $port rule added to the firewall."
        } else {
            Log-Message "UDP Port $port rule already exists in the firewall."
        }
    }
    Log-Message "Firewall ports check and open process completed."
}

# Main Script Execution
Log-Message "MAIN Script execution started."
$currentPort, $portLocation = Read-CurrentPort
if (-not $currentPort) {
    Log-Message "No existing port found. Exiting script."
    return
}

$apiNodes = Fetch-And-Process-Nodes

# Validate nodes
$staticNodes = $apiNodes | Where-Object { $_ -like "enode://*" }

# Ensure static nodes are between 60 and 100
$minStaticNodes = 60
$maxStaticNodes = 100
$staticNodeCount = [Math]::Min($staticNodes.Count, $maxStaticNodes)
$staticNodeCount = [Math]::Max($staticNodeCount, $minStaticNodes)
$staticNodes = $staticNodes | Select-Object -First $staticNodeCount

Write-Files -bootstrapNodes $PROVIDED_ENODES -staticNodes $staticNodes -customPort $currentPort -destinationDir $portLocation
Open-FirewallPorts
Log-Message "Script execution completed. Check the output files and firewall settings."
Log-Message "Summary of actions: Port read, batch and config files created, firewall ports processed."
Log-Message "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")





