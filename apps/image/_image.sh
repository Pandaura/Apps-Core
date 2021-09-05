#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################

# BAD INPUT
badinput() {
  echo
  read -p '⚠️ ERROR - Bad input | PRESS [ENTER] ' typed </dev/tty
  question1
}

# FUNCTION - ONE
question1() {
declare YELLOW='\033[0;33m'
declare NC='\033[0m'
  # Recall Program
  image=$(cat /tmp/program_var)

  # Checks Image List
  file="/opt/coreapps/apps/image/$image"
  if [ ! -e "$file" ]; then exit; fi

  tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💼  Multi image selector - ${YELLOW}\"$image\"${NC}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF

  count=1
  while read p; do
    echo "$count - $p"
    echo "$p" >/tmp/display$count
    count=$((count + 1))
  done </opt/coreapps/apps/image/$image
  echo ""
  read -p '💬  Type Number | PRESS [ENTER]: ' typed </dev/tty

  if [[ "$typed" -ge "1" && "$typed" -lt "$count" ]]; then
    mkdir -p /var/plexguide/image
    cat "/tmp/display$typed" >"/var/plexguide/image/$image"
  else badinput; fi
}

# END OF FUNCTIONS ############################################################

question1
