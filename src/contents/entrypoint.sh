#!/bin/bash
set -e

exec echo "Starting squid..."
exec $(which squid) -NCd 1
