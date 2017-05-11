[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias vim=nvim
alias vi=nvim
export EDITOR="emacsclient -t"
export KEYTIMEOUT=1

smacs() {
    t=()

    if [ ${#@} -ne 0 ]; then
        while IFS= read -r file; do
            [ ! -f "$file" ] && t+=("$file") && /usr/bin/touch "$file"
            file=$(echo $(cd $(dirname "$file") && pwd -P)/$(basename "$file"))
            $(/usr/bin/osascript <<-END
                if application "Emacs.app" is running then
                    tell application id (id of application "Emacs.app") to open POSIX file "$file"
                else
                    tell application ((path to applications folder as text) & "Emacs.app")
                        activate
                        open POSIX file "$file"
                    end tell
                end if
END
            ) &  # Note: END on the previous line may be indented with tabs but not spaces
        done <<<"$(printf '%s\n' "$@")"
    else
        open -a "Emacs"
    fi

    if [ ! -z "$t" ]; then
        $(/bin/sleep 5; for file in "${t[@]}"; do
                            [ ! -s "$file" ] && /bin/rm "$file";
                        done) &
    fi
}
