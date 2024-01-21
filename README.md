download and Unzip

RIGHT CLICK and run ETCMCtune5 AS ADMINISTRATOR

stop your node, WAIT 5 SECONDS... CLOSE ALL WINDWS AND APPS.

REBOOT THE COMPUTER

Relaunch your node

tip jar: 0x6f1BC68CBb7C19c263d9EBC708c139be1c48c636

ETCMCtune5
is a PowerShell script automates the setup and configuration of ETCMC nodes, streamlining the process for users and administrators.

Key Features:

Node Discovery: Connects to blockscout to fetch a list of active ETCMC nodes, filtering them based on specific port criteria (30303 to 30312).

Data Processing: Processes each node to eliminate duplicates and ensure compliance with the port criteria. The resulting list of nodes is saved in a new configuration file inside the geth application folder batch File Generation: Generates a batch file (START_GETH_FAST_NODE.bat) to start an ETCMC node with predefined Approved ETCMC bootloading fullnodes and will keep your custom port if you had one in batch

File Management: Moves these generated files to the appropriate system directories, automatically handling file renaming. Firewall Configuration: Automatically opens necessary TCP and UDP ports (30303 and whatever custom port you had in the batch file for the ETC node operation, catering to WebSocket protocols.

Ideal for quickly and efficiently setting up ETCMC nodes, this script is a boon for both individual enthusiasts and administrators managing multiple nodes. It ensures a consistent, error-free setup process with minimal manual intervention.

Environment: Written in PowerShell, it is primarily designed for Windows environments but adaptable to Linux and macOS with PowerShell Core.

License You are free to use or alter my software in any way you need or want.
