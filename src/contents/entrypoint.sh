#!/bin/bash
set -e

echo "Starting squid..."
exec $(which squid) -NCd 1
