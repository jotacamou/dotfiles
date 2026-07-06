#!/bin/sh
# Toggle the orientation of a 2-pane tab between side-by-side (right) and
# stacked (down) -- an approximation of tmux's `prefix + space` (next-layout)
# for the common two-pane case.
#
# herdr ignores --split when a pane is moved within its own tab (no-op), so we
# round-trip the sibling through a scratch tab: move it out, then move it back
# in with the opposite split direction. The empty scratch tab auto-closes.
#
# Bound from herdr config.toml via a [[keys.command]] block (type = "shell").
# Resolves the focused pane from the server, so it works when run detached.

set -eu

panes=$(herdr pane list)
focused=$(printf '%s' "$panes" | jq -r '.result.panes[] | select(.focused == true) | .pane_id')
tab=$(printf '%s' "$panes" | jq -r '.result.panes[] | select(.focused == true) | .tab_id')

if [ -z "$focused" ] || [ "$focused" = "null" ]; then
  herdr notification show "Toggle orientation" --body "No focused pane found" --sound none
  exit 0
fi

layout=$(herdr pane layout --pane "$focused")

# Only handle the simple 2-pane / single-split case.
pane_count=$(printf '%s' "$layout" | jq '.result.layout.panes | length')
if [ "$pane_count" != "2" ]; then
  herdr notification show "Toggle orientation" \
    --body "Needs exactly 2 panes in the tab (found $pane_count)" --sound none
  exit 0
fi

cur_dir=$(printf '%s' "$layout" | jq -r '.result.layout.splits[0].direction')
other=$(printf '%s' "$layout" | jq -r --arg f "$focused" \
  '.result.layout.panes[] | select(.pane_id != $f) | .pane_id')

# Flip orientation: right (side-by-side) <-> down (stacked).
if [ "$cur_dir" = "right" ]; then
  new_dir="down"
else
  new_dir="right"
fi

# Round-trip the sibling out and back to force the new split direction.
herdr pane move "$other" --new-tab --label _herdr_scratch --no-focus >/dev/null
herdr pane move "$other" --tab "$tab" --split "$new_dir" --target-pane "$focused" --no-focus >/dev/null
