#!/usr/bin/env bash

shopt -s nullglob globstar

typeit=0
if [[ $1 == "--type" ]]; then
	typeit=1
	shift
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

password=$(printf '%s\n' "${password_files[@]}" | dmenu "$@")

[[ -n $password ]] || exit

pass_cmd=show
if pass show "$password" | grep -q '^otpauth://'; then
    pass_cmd=otp
fi

if [[ $typeit -eq 0 ]]; then
	pass $pass_cmd -c "$password" 2>/dev/null
else
	pass $pass_cmd "$password" | { IFS= read -r pass; printf %s "$pass"; } |
		xdotool type --clearmodifiers --file -
fi
