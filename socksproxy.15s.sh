#!/usr/bin/env bash

# <bitbar.title>Prosy</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Taha Al-Jody</bitbar.author>
# <bitbar.author.github>TA3</bitbar.author.github>
# <bitbar.desc>Enable/Disable Socks proxy + status (useful for ssh tunnelling)</bitbar.desc>
# <bitbar.image></bitbar.image>
# <bitbar.dependencies>bash</bitbar.dependencies>

# BitBar CPU Load plugin
isSockProxyWiFiEnabled="$(networksetup -getsocksfirewallproxy wi-fi | grep ^Enabled: | awk '{print $2}')"
if [ "$1" = 'toggle' ]; then
	if [ $isSockProxyWiFiEnabled = "Yes" ]; then
        	networksetup -setsocksfirewallproxystate wi-fi off
	else
        	networksetup -setsocksfirewallproxystate wi-fi on
	fi

	exit
fi

if [ $isSockProxyWiFiEnabled = "Yes" ]; then
	proxyDisplayIcon="ᗝ | color=green"
else
	proxyDisplayIcon="ᗝ | color=red"
fi
echo $proxyDisplayIcon
echo "---"
echo "Toggle Proxy | bash='$0' param1=toggle terminal=false refresh=true"
echo "Refresh | refresh=true"
