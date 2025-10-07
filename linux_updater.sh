#!/bin/bash
LOG_FILE="$HOME/linux-update-$(date +%F).log"
echo "System update started..." | tee -a "$LOG_FILE"
START_TIME=$(date +%s)

echo "Updating package list..." | tee -a "$LOG_FILE"
sudo apt update 2>&1 | tee -a "$LOG_FILE"

echo "Upgrading packages..." | tee -a "$LOG_FILE"
sudo apt full-upgrade -y 2>&1 | tee -a "$LOG_FILE"

echo "Removing old packages..." | tee -a "$LOG_FILE"
sudo apt autoremove -y 2>&1 | tee -a "$LOG_FILE"

END_TIME=$(date +%s)
DURATION=$((END_TIME-START_TIME))

echo "System update completed!" | tee -a "$LOG_FILE"
echo "Total time: $DURATION seconds" | tee -a "$LOG_FILE"
echo "Log file saved at: $LOG_FILE"
