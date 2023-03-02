# Reason

eval "$(github-copilot-cli alias -- "$0")"

The command by [github-copilot-cli](https://www.npmjs.com/package/@githubnext/github-copilot-cli) to create alias for the terminal and allow running the command directly without copying did not work on fish.

I created a fish shell based function that replicated the functionality intended for fish. Mostly copied from the output it seemed they wanted:

```sh
eval "$(github-copilot-cli alias -- "/usr/bin/fish")"

# outputs their config for .bashrc
```

Add to your own fish config or add this to `~/.config/fish/config.fish`.