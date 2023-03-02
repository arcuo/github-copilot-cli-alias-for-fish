# Reason

eval "$(github-copilot-cli alias -- "$0")"

The command by [github-copilot-cli](https://www.npmjs.com/package/@githubnext/github-copilot-cli) to create alias for the terminal and allow running the command directly without copying did not work on fish.

I created a fish shell based function that replicated the functionality intended for fish. Mostly copied from the output it seemed they wanted. See Info.

# Usage

Add to your own fish config or config copy file to `~/.config/fish/config.fish`.

# Info

Made with version

```sh
github-copilot-cli --version
0.1.16
```

Checking out their output from `alias`

```
github-copilot-cli alias -- "/usr/bin/fish"

  copilot_what-the-shell () {
    TMPFILE=$(mktemp);
    trap 'rm -f $TMPFILE' EXIT;
    if ~/.local/share/pnpm/global/5/node_modules/@githubnext/github-copilot-cli/cli.js what-the-shell "$@" --shellout $TMPFILE; then
      if [ -e "$TMPFILE" ]; then
        FIXED_CMD=$(cat $TMPFILE);
        
        eval "$FIXED_CMD"
      else
        echo "Apologies! Extracting command failed"
      fi
    else
      return 1
    fi
  };
alias '??'='copilot_what-the-shell';

  copilot_git-assist () {
    TMPFILE=$(mktemp);
    trap 'rm -f $TMPFILE' EXIT;
    if ~/.local/share/pnpm/global/5/node_modules/@githubnext/github-copilot-cli/cli.js git-assist "$@" --shellout $TMPFILE; then
      if [ -e "$TMPFILE" ]; then
        FIXED_CMD=$(cat $TMPFILE);
        
        eval "$FIXED_CMD"
      else
        echo "Apologies! Extracting command failed"
      fi
    else
      return 1
    fi
  };
alias 'git?'='copilot_git-assist';

  copilot_gh-assist () {
    TMPFILE=$(mktemp);
    trap 'rm -f $TMPFILE' EXIT;
    if ~/.local/share/pnpm/global/5/node_modules/@githubnext/github-copilot-cli/cli.js gh-assist "$@" --shellout $TMPFILE; then
      if [ -e "$TMPFILE" ]; then
        FIXED_CMD=$(cat $TMPFILE);
        
        eval "$FIXED_CMD"
      else
        echo "Apologies! Extracting command failed"
      fi
    else
      return 1
    fi
  };
alias 'gh?'='copilot_gh-assist';
alias 'wts'='copilot_what-the-shell';

```