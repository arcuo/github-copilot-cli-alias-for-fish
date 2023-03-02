# Github copilot cli aliases for fish

function run_copilot
    set -l TMPFILE $(mktemp);

		function cleanup --inherit-variable TMPFILE
			rm -f $TMPFILE
		end

    if github-copilot-cli $argv[1] "$argv[2..-1]" --shellout $TMPFILE
      if [ -e "$TMPFILE" ]
        set FIXED_CMD $(cat $TMPFILE);
				echo "> $FIXED_CMD"
				echo ""
        eval "$FIXED_CMD"
      else
        echo "Apologies! Extracting command failed"
      end
    else
      return 1
    end

		cleanup
end

alias 'pl'='run_copilot what-the-shell';
alias 'ghpl'='run_copilot gh-assist';
alias 'gitpl'='run_copilot git-assist';