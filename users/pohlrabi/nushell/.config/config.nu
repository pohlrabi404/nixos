def lla [ ...args ] { ls -la ...(if $args == [] {["."]} else {$args}) | sort-by type name -i }
