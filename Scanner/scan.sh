mkdir ../scan
nmap 192.168.1.1-254 -PE -PS80,443,3389 -PP -PA21 -PU161,40125 --source-port 53 -oX ../scan/$(date +%s).scam