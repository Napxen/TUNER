# Constants
$TARGET_NODES = 50
$API_URL = 'https://api.etcnodes.org/peers?all=true'
$NODES_FILE = "found_nodes.txt"
$BATCH_FILE = "START_GETH_FAST_NODE.bat"
$CONFIG_FILE = "config.toml"
$STATIC_NODES_FILE = "STATIC_NODES.json"
$LOG_FILE = "script_log.txt"
$CUSTOM_PORT_FILE = "custom port detected.txt"

# etcmc OFFICIAL BOOTLOADERS
$PROVIDED_ENODES = @(
    "enode://2f690ad04d64891c70b08066e9d99f3e7ec97b5fdea9d412780a3bc07dbc2f2ad0e9c7f859f88308514e79776d703fb81848a708bab922fb12f866696be3c169@87.212.41.71:30307",
"enode://b170973d769385e9a005b13374ff94c18cc9bb8c4605dbffb69f9317f0dcb1026152bf3b5b7d4ea6e19d5858cf8bf0c6caa4d16c88aa94970b40a8565b56831f@208.69.189.17:30303",
"enode://732320c1b34f937f7d2d5f4342003a11b47ce17437b3535c1bebd50729d5f93d4d8c180751ade3e7a66a9d2401bc5888d30e4f85c41b99441bbb9ff1dc45893c@73.249.49.117:30303",
"enode://7a2d2ac51bce072c6fd013e9d7a0a90e87fec022b3cab3fb6177c76e15075d299936bcc6a0e73449aa2b52ab911e5119c0f99b9d1dbc7f3d539c5c739503585c@87.212.41.71:30320",
"enode://4a3faa64770acc516993e57a2929a2cd0761c05cfdeee4d1e0ab0a98e4f8976e2fb352af311bfaa70ee55af28298fee1206b6e4a97d02b623536c8272aa16621@87.212.41.71:30309",
"enode://9606793ccb2daa49e12c7a5e152544928c2ca9d5f610a2f213fbbb45d271fd94d1e18a2ded4bf43b319c1a7751ee9d95a749f04761b165fe53e1c1ed3260f29d@158.220.105.249:30303",
"enode://edcb4922dd61a10d32d4d73e1c8413a0c473154615af48865d2ac0841f82b1ff4b9dee0f6d5ccdd8d037a14ee0c63a178cab215f2f7eb9494faa8260b1cd266d@167.86.77.160:30303",
"enode://18210f25fb151dac37d972027d97b67b70abc8bb4a54e14df2072a7619103a9ed5e62873aa64fd4dfab98242f25eb42b424b44bf6008149520c02dae139f5df3@62.171.169.170:30303",
"enode://4138f3363493960b2390dde35108c074859b334876c2a707d4611083cbbeeab50183a1ebf132181411e7417487b0a075d1935fcbbb13dba20601d89c1d73c1d6@bigknd1.ddns.net:30303",
"enode://8daf044b0ac11a6ff7f3b1fcd3e9f84508bde8bf6823da3f9d4b780f5083b7bde59a56c14a1415390fd510e4c6d1d0ec84e097d3ac7aa4aae949e12f0bbb7578@bigknd.ddns.net:30303",
"enode://29240f40235b978d23db9b0b7c07b6632c3afb37b13d8e37db1077738261bffb1a79b5ea6166bd5f0aec41c150550d37aad53b1c498531cab297e7380c91a2e3@bigknd1.ddns.net:30305",
"enode://4f3165d0201d0ea5577ebf7c07bd9e895edd6730e18623600f993308a09bdf54cb0990b06a1f2790a6d11550bef3ba61fc096c590015c1e0d7d9cc2dc5951259@bigknd.ddns.net:30305",
"enode://ff47e39ac848a9a4e902ec333a8865761815f25b42080cb1b636a91491fcc4eaf82ab77614aacf47e7baa67d1e2425c2ad902840be522cf43dbf33b0079d9ce9@exodus.dyndns.tv:30303",
"enode://16dd07a2091d25b4d016a3467710e831d132adb016798f05c9d263f033e605aee77ea6b1478f2761da1f7ca01a97405157f99808481b809797e002a3605fcca6@exodus.dyndns.tv:30305",
"enode://9b899c6b0a8cd4845b1f1851b85e203e21e400762829b78498513e67de2bc9355e546a98e2fcfbe3a994ab56a6819c06a29f61a35366d5abad500c1cf9429d87@exodus.dyndns.tv:30306",
"enode://a68a4cae5e834d85054ad3aee5e4cb62d9a61642b6ef947fdfe77c6435a02c214f4538f116ded49d69f52b62b0af1e9177cf0e5ba10d276eeb12d07478ac0bf8@lethe-nka.dyndns.org:30303",
"enode://ee07d8d38253a9cd505c5fb921a683b61d4bd68f5cb81f9f4ee70eb4777a9ec3803ca11c4ff2fe095708a0e36415c98f1caace2c3e7de94564f6617ebd5ac3ad@exodus.dyndns.tv:30307",
"enode://eec7d752744599f9e7b2472ac513a30d763986d45f3880e7e5e195ecc6525db51f27179c8b502258419b1b945a59f81d3c86e3ac9c8631d1f9591a16177cea41@82.24.209.150:30303",
"enode://ea725578d03afc20ee71028f766400e80cbe756139386f6e423814b465d7f5ff09220fcabaaa8c7d79f5b552c0d1c93b22523fcf879eeb770caeacea87143cfd@82.24.209.150:30314",
"enode://377436cb75f01bc9204ffe262274a69f96e7a6e7f968f0a62ed9b24fea9ab8933258ff2dbef00f007f6a34cacdc1fd2e2465287b397f263f93581c2781e71f18@82.24.209.150:30315",
"enode://bcf3a38fe797c4ece48abbdb2206df4a569373e602e0dd43398a363a4ae9544254bc152acd98cd07b7fe628e81230a1872e6a46a652d74fe13cf8fc41472ef10@mainetz.ddns.net:30303",
"enode://1deb396330e927cca22620a7cd9cf51a9f92e84147ba83a21a09cdc07da0aab134006f78a0d30f8eeff96b8482666af440e7803b650c24e5857ec980490d3fa3@mainetz.ddns.net:30322",
"enode://7517174774317dd96c6f151d5d2866189b2e604c6d3a66c8f9d92269284fda1bf7ce8e6b078a168227540d4e090c95dbf0810ca26ddf4a957d886ffc48201615@67.188.2.34:30303",
"enode://1bce1c23919005f7e41f6f6c55fafcf217b517aa9a499ffc6e2fa2a425190739de7e3bd0782e1fe6319e3e0f44d0b4710983881f45f9ec783533433508becfe9@87.115.150.121:30303",
"enode://1a71bf8a44fe17e29cdd262a6686cefac7240e35d2696d0543abd27ba45d52abea26fb9dba887e1620ad3b86f00079c345482207c8850080d514190e21f2e8b6@mai829.ddns.net:30303",
"enode://56b09f4722f2e7145e837ae8975fbdfc2ba9fbdfd1c9fd7e2907aeacddd5daba8503bef21e6c26e915164a28b729158a4ec0c943d410c77d48f42e08eef0fb16@mainetz.ddns.net:30305",
"enode://1b6a3e864621a722e4849d2700a2789757a8f2b77de6e1c6aff7a1cb9052b4f5009338ccefc09274abd3b2ab2f4c92dd7c22a77b20464494f53e700fc116cfb9@bigknd2.ddns.net:30303",
"enode://84e41e0141d42541bf2f34ddae33671e8cbe51d83d386802f7aae39f46713c3270592116bce60d39d0b7f59b75a960eb73603d5ec6f60e69fbf553cc9dfa56d7@bigknd2.ddns.net:30305",
"enode://6f950f989f3a9fd2cbc0425920715e665b2cf982ebc27ccd4006368aef31199afa72f8b231b7fd0a92b8e147d351c869c897ad36c83c04d2c5d9411fc46ccf7d@104.205.158.187:30303",
"enode://fe3fce08d5a0dbbc240fc1d4dd79a63f325ac5194459c8d98a3816e1a7f3af1b30a02497c482c0184db07bc59ae7fc2f5640b5717a77c46e7503823828f34d16@bootnode.ddns.net:30303",
"enode://65d65a5f9d666affb35c98d355aab546cb6a55fcf2f3d3899bbe3436c535e21e4f34a1051067c6ffdce3a886cfc84a74e12b57843e63427796d273b846e51ce4@81.246.151.148:30303",
"enode://aba4fc3d856f3850f99ec9db7e45af43acad03c925c4c44e334fae14e32249c58cfc705cc54796d88bae5c9a99c7184768d518b2496cb105871bc74c12ecc9c8@217.122.83.122:30303",
"enode://9519990a042006719739daad199c4a363dc30a22d632ff3085a70a2ec7041ae78a4c0ba5851fe3b487d4e461c65e83c33c39d0c64a691b1e87cbaf07de64ad8d@217.122.83.122:30330",
"enode://792c4a3864fdd475de982f021ea24a145162474695c9f4d37c42f1eb22a715d72842bceed7fb238cfd8c9c9ff05d17b21eb497637a0921440f2369ebdb3973d9@217.122.83.122:30340",
"enode://10fb601da4043ff8cf6831c3ce3abf747a6cb8fb96bd4e07b1d2e0740a18ed205cb495aed4b536488c49891ddb581d5aaf5f9fbdd7abf1b4b0c980c819d1a80e@217.122.83.122:30350",
"enode://4be1b1c1f14b6dd069ace017ce2bb44417632bf2790965997c671e5cee2b8e22c432daacf1cb9a3db419ae5ccbb00134eaed2d521b50db397b2bd53621454057@92.34.101.13:30303",
"enode://2c5cb2e331f56256696996a465709f2cae9fe0ca7358cf1a820ab61bcf233e7458b73d0e414e60bb2a0bf7d7ad1887c62ee5c333212cc64509b80b214274f079@197.234.147.16:30303",
"enode://d3a09543e3991a0bc2bf447017f719c56651905a434f6a95ca7219ea945f1493eb3ae4e8d3605ff82dd86d1e231111ff204201774b7ee78fe38394fe5f36cb06@185.157.26.107:30303",
"enode://5dbc6cfe4a31ac2d79e2052ede6194fd849af2adfe9f8f3d2eefa375bd7676dee717009db1caeedb21f2256f5bae69753a33b6c9b47107caf785899aaa4da5cd@72.75.209.137:30303",
"enode://4bb837f292d2db17825b0fbc7f9f148a4fba295f883fa4d0e545a171426f2ca50ef2b2c02d8fba5d467f69e68602005bcead6ab72d6e9c348a92a2472fd38379@etcmc.duckdns.org:30303",
"enode://adca586b9ddd569c774879f1261aeb6204d29bbd9427eb801cf9ae8281b5da2d751d39a3acc1c0cbe561f415422766ffb083bc7aae728e1f21beda763b7f2841@79.116.151.174:30303",
"enode://5bff5b230358d5f6d39216a24ef11aa4dd3dc52051c66cc01e81362ee93ad9ffbe50d6c67762039eb079a033fa21cc497d1b58a959da9a8c64d9d7c8547d482b@179.61.206.63:30303",
"enode://2e707635f2eb71cc8c49fbfa77091553452aad8f737b308b089e46debc2a2c02255abf29111f3554484514448044cbb76cb8cce6257d62ca209b5fafefcc7cc2@98.113.144.71:30303",
"enode://4d30be4952784686e0deb7743cbaecf560eb050ef77a7bd6cbeddd248b091c65eff6fd84162a2f465a7b5af283923cea7428cd2da2ad658163ed647d7739dc0f@207.180.217.136:30303",
"enode://df3b5fb7210c9d4c595bf3d859f0efcb0533eb5509730c97449113b2cd7f88cb47b1aec62f66e2f1ecf95f7a0d1cf2f661cfae6ca760d41a9b0e070d7e6a76a1@115.85.88.10:30303",
"enode://4d0ca698966c5a14724e05b5c95ac6bea2c381f0f6aad91fc8d2cab6faec46ddb768b03db71a97cbc6fe02d51b0b21d13def0a32e5a49957722af05f1cf8af7d@38.15.36.138:30303",
"enode://2f9420891e059bcb070da8c00a9f659cd98b533fe94448a2640ae08b941d8401101581bc166dce7b6df5e6cf5c147498f69556ee146ad47f82093941f8507a25@tdh.hopto.org:30303",
"enode://17a7c2c816f9086e9ec41a83dd714ac3f2746cc5dd8d0503e340e6c0e5a7f88598f1910390bfbe667b95383620786b7d4159517a82d4a05b6f16a7d09d02446c@94.60.76.153:30303",
"enode://8402bdf137de8fb47c51b06e855f160741bfb05cddaee056b05c1b1ff766c1f6fb523620b07ae02faf22cb6a5f241ab80315402771add76995e3b8540abe2bb3@foxcoinz.ddns.net:30303"
)

function Log-Message {
    param ([string]$message)
    Add-Content -Path $LOG_FILE -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): $message"
    Write-Host $message
}

function Read-CurrentPort {
    $locations = @(
        "C:\Program Files (x86)\ETCMC ETC NODE LAUNCHER 1920x1080\ETCMC_GUI\ETCMC_GETH",
        "C:\Program Files (x86)\ETCMC ETC NODE LAUNCHER 1024x600\ETCMC_GUI\ETCMC_GETH"
        # Removed "D:\" as it was causing issues in Script A
    )

    foreach ($location in $locations) {
        $batchFilePath = Join-Path $location $BATCH_FILE
        Log-Message "Checking for batch file at: $batchFilePath"
        if (Test-Path $batchFilePath) {
            Log-Message "Found batch file at: $batchFilePath"
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
            Log-Message "No port information found in batch file at: $batchFilePath"
        } else {
            Log-Message "Batch file not found at: $batchFilePath"
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
        # Adjust the regular expression to accurately match the port range
        $filteredNodes = $nodes | Where-Object { $_.enode -and $_.enode -match ":3030[3-9]|:3039[0-2]" -and $_.enode -notmatch "\?discport=" }
        Log-Message "Found $($filteredNodes.Count) nodes after filtering"
        # Increase the number of nodes fetched if necessary
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
        $batchContent += "`"$node`", "
    }

    # Remove the last comma and space, then add the console command
    $batchContent = $batchContent.TrimEnd(", ")
    $batchContent += " console`n"

    Set-Content -Path (Join-Path $destinationDir "batchFile.bat") -Value $batchContent
    Log-Message "Batch file written to $destinationDir"
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
    $ports = @(30303..30312 + 8545, 8546, 55802)
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
