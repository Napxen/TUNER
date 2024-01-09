download and Unzip

right click and run Tunerv3.3 as administrator

stop your node, wait 5 seconds, then close all geth windows. 

Relaunch your node


tip jar: 0x6f1BC68CBb7C19c263d9EBC708c139be1c48c636
# ETCMC-node-Tuner-V3.3
TunerV3.3 is a PowerShell script automates the setup and configuration of ETCMC nodes, streamlining the process for users and administrators.

Key Features:

Node Discovery: Connects to blockscout to fetch a list of active ETCMC nodes, filtering them based on specific port criteria (30303 to 30399).

Data Processing: Processes each node to eliminate duplicates and ensure compliance with the port criteria. The resulting list of nodes is saved in found_nodes.txt.

Configuration File Generation:
1. Generates a batch file (START_GETH_FAST_NODE.bat) to start an ETCMC node with predefined settings and will keep your custom port if you had one in batch (like sync mode, cache size, network ports, and bootloading enodes ).
2. Creates a TOML configuration file (config.toml) containing details of the static nodes pulled from Blockscout.

File Management: Moves these generated files to the appropriate system directories, automatically handling file backups and renaming.
Firewall Configuration: Automatically opens necessary TCP and UDP ports (30303 to 30399, 8545, 8546, 55802) for the ETC node operation, catering to both HTTPS and WebSocket protocols.

Ideal for quickly and efficiently setting up ETCMC nodes, this script is a boon for both individual enthusiasts and administrators managing multiple nodes. It ensures a consistent, error-free setup process with minimal manual intervention.

Environment: Written in PowerShell, it is primarily designed for Windows environments but adaptable to Linux and macOS with PowerShell Core.

License
You are free to use or alter my software in any way you need or want. 
