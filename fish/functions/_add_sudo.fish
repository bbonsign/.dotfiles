# Copied from https://github.com/eth-p/fish-plugin-sudo/blob/master/functions/__ethp_toggle_sudo_commandline.fish
function _add_sudo --description 'Toggles sudo on the command line.'
	set -l buf (commandline -b)
	set -l pos (commandline -C)

	if echo "$buf" | grep "^sudo .*\$" 1>/dev/null 2>/dev/null
		commandline -r (string sub -s 6 -- "$buf")
		commandline -C (math $pos-5)
	else
		commandline -r "sudo $buf"
		commandline -C (math $pos+5)
	end
end
