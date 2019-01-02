#!/bin/bash

set -euo pipefail

COMMAND=${1:-plan}
OPTS=
[ "$COMMAND" = plan ] || OPTS=-auto-approve

STATE="base.tfstate"

terraform init terraform/
terraform $COMMAND $OPTS \
	-state="data/$STATE" -refresh=true \
	terraform/