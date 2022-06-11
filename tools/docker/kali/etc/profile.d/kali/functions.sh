function ff () {
  find "${@:-.}" -type f 2>/dev/null | fzf -m
}

function nse () {
  find /usr/share/nmap/scripts -type f \
    | fzf -m | xargs -I {} basename {} | xargs | sed -e 's/\ /,/g' \
    | xsel --clipboard --input && xsel --clipboard --output
}

function seclists () {
	dst_path="${1:-.}"
	src_path=/usr/share/seclists
	find "$src_path" -type f 2>/dev/null | fzf -m | xargs -I {} cp -v {} "$dst_path"
}

function exploitdb () {
	dst_path="${1:-.}"
	src_path=/usr/share/exploitdb
	find "$src_path" -type f 2>/dev/null | fzf -m | xargs -I {} cp -v {} "$dst_path"
}

function gg () {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

function ssploit () {
  echo "searchsploit --colour --json \"$@\"  2> /dev/null | jq '.RESULTS_EXPLOIT[] | select(.Type | contains(\"dos\") | not)'"
  searchsploit --colour --json "$@"  2> /dev/null \
    | jq '.RESULTS_EXPLOIT[] | select(.Type | contains("dos") | not)'
}

function ssploit-links () {
  echo "searchsploit -w --colour --json \"$@\"  2> /dev/null | jq '.RESULTS_EXPLOIT[]'"
  searchsploit -w --colour --json "$@"  2> /dev/null \
    | jq '.RESULTS_EXPLOIT[]'
}

function urlencode () {          
  python3 -c "import urllib.parse; print(urllib.parse.quote_plus(\"$@\"))"
}

function urls () {
  URLS_FILE=${URLS_FILE:-$HOME/.urls}
  touch $URLS_FILE
  cat $URLS_FILE <(tmux capture-pane -pS -500) \
  | grep -oiE "(http|ftp)s?://[^'\"\ ]+" \
  | awk '{print $1}' \
  | sort -u \
  | tee $URLS_FILE \
  | fzf -m | tee -a /dev/stderr
}
