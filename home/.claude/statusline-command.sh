#!/bin/sh
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
branch=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory
home="$HOME"
short_cwd="${cwd/#$home/\~}"

# Substitute ~/Development -> Dev (matching starship config)
short_cwd="${short_cwd/#\~\/Development/Dev}"

# Build output
printf "\033[34m%s\033[0m" "$short_cwd"

if [ -n "$branch" ]; then
  printf " \033[35m%s\033[0m" "$branch"
fi

if [ -n "$model" ]; then
  printf " \033[36m%s\033[0m" "$model"
fi

if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  printf " \033[33mctx:%s%%\033[0m" "$used_int"
fi

printf "\n"
