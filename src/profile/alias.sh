alias ll='ls -al'


alias dnsmasq.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist'
alias dnsmasq.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist'
alias dnsmasq.restart='dnsmasq.stop && dnsmasq.start'

alias nginx.start='sudo launchctl load /Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload /Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'

alias php55.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php55.plist"
alias php55.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php55.plist"
alias php55.restart='php55.stop && php55.start'

alias php56.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php56.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php56.restart='php56.stop && php56.start'

alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.restart='mysql.stop && mysql.start'

alias elasticsearch.start="launchctl load -w /Users/donatm/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist"
alias elasticsearch.stop="launchctl unload -w /Users/donatm/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist"
alias elasticsearch.restart="elasticsearch.stop && elasticsearch.start"

alias logstash.start="launchctl load -w /Users/donatm/Library/LaunchAgents/homebrew.mxcl.logstash.plist"
alias logstash.stop="launchctl unload -w /Users/donatm/Library/LaunchAgents/homebrew.mxcl.logstash.plist"
alias logstash.restart="logstash.stop && logstash.start"

alias dnsflush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

alias redis.start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis.stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis.restart="redis.stop && redis.start"
