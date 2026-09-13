# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
# /etc/omarchy.conf is written by omarchy-dev-link. When absent, force the
# package default instead of preserving a stale inherited dev-link value before
# we decide which rc file to source.
if [[ -f /etc/omarchy.conf ]]; then
  source /etc/omarchy.conf
  export OMARCHY_PATH="${OMARCHY_PATH:-/usr/share/omarchy}"
else
  export OMARCHY_PATH=/usr/share/omarchy
fi
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
alias p='python3'
alias l='lsa'
alias vpn='/opt/cisco/secureclient/bin/vpn -s < /opt/cisco/secureclient/bin/vpn.conf'
alias vpnd='/opt/cisco/secureclient/bin/vpn disconnect'
alias vpns='/opt/cisco/secureclient/bin/vpn -s < /opt/cisco/secureclient/bin/status.conf'
alias dkuvpn='/opt/cisco/secureclient/bin/vpn -s < /opt/cisco/secureclient/bin/dku_vpn.conf'
alias ptfvpnc="sudo openfortivpn vpn.aeonfinance.com.vn --saml-login"
alias andvpn='sudo gpclient connect vpn.andsolutions.net --browser --cookie-cache'
 
alias venv='source ./.venv/bin/activate'
alias sshchatdku='ssh Ar-temis@10.200.14.82'
alias sshserver1='ssh Ar-temis@10.201.8.233'
alias sshserver2='ssh Ar-temis@10.201.8.114'

# Shell tool aliases
alias ff='fzf'
alias lg='lazygit'

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"
