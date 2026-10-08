#!/bin/bash

SESSION_NAME="kws"
WORKING_DIR="/Users/jona/IdeaProjects/citai/field-management/"

# Check if the session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
  echo "Session $SESSION_NAME already exists. Attaching to it."
  tmux attach-session -t $SESSION_NAME
else
  # Create a new session and name it
  tmux new-session -d -s $SESSION_NAME

  # Hopefully makes 4 panes
  tmux split-window
  tmux split-window

  tmux select-layout tiled

  # Send a command to the first pane
  tmux send-keys -t 0 "cd $WORKING_DIR" C-m
  tmux send-keys -t 0 "docker compose down && docker compose up" C-m

  # Send a command to the second pane
  tmux send-keys -t 1 "cd $WORKING_DIR/server" C-m
  tmux send-keys -t 1 "./gradlew bootRun" C-m

  # Send a command to the third pane
  tmux send-keys -t 2 "cd $WORKING_DIR" C-m
  tmux send-keys -t 2 "nx run serve" C-m

  # Attach to the created session
  tmux attach-session -t $SESSION_NAME
fi
