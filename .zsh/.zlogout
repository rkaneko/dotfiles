#
# Executes commands at logout.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if [[ -s "$HOME/.zlogout.local" ]]; then
  source "$HOME/.zlogout.local"
fi

# Print the message.
cat <<-EOF

Thank you. Come again!
  -- Dr. Apu Nahasapeemapetilon
EOF

