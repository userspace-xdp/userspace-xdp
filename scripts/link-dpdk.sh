#!/bin/bash

set -xe

infdpdk=tapdpdk
bridge=br0

### Attach dpdk tap to the bridge
brctl addif $bridge $infdpdk
