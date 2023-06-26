set -e
set -u
set -x

rm -rf /tmp/myproject
mkdir -p /tmp/myproject

cp master-sg.tf worker-sg.tf /tmp/myproject
txtar-c /tmp/myproject
txtar-c /tmp/myproject | pbcopy
