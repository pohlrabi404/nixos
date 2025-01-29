def lla [...args] { ls -la ...(if $args == [] {["."]} else {$args}) | sort-by type name -i }

do --env {
	let ssh_agent_file = (
		$nu.temp-path | path join $"ssh-agent-($env.USER? | default "pohlrabi").nuon"
	)

	if ($ssh_agent_file | path exists) {
		let ssh_agent_env = open ($ssh_agent_file)
		if ($"/proc/($ssh_agent_env.SSH_AGENT_PID)" | path exists) {
			load-env $ssh_agent_env
			return
		} else {
			rm $ssh_agent_file
		}
	}

	let ssh_agent_env = ^ssh-agent -c
		| lines
		| first 2
		| parse "setenv {name} {value};"
		| transpose --header-row
		| into record
	load-env $ssh_agent_env
	$ssh_agent_env | save --force $ssh_agent_file
}

$env.config = {
    edit_mode: vi
    float_precision: 2
    footer_mode: "always"
    use_ansi_coloring: true

    filesize: {
        metric: true
    }
    buffer_editor: "nvim"
    show_banner: false
}
