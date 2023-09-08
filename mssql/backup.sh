#!/bin/bash
#
# Automatisches Sichern von speziellen anzugebenden Ordner
# mit Hilfe von "rsync" und cronjob
#
set -x

REMOTE=$1
export SSHPASS=$2

# Angabe der Ordner die gesichert werden soll.
# ACHTUNG
# /[Ordner]/ -&gt; Inhalt des Ordners wird gesichert
# /[Ordner] -&gt; Ordner wird gesichert
SOURCES="/mssql/backup/"

# Ziel des Backups auf dem entfernten Rechner.
TARGET="${REMOTE}:/mssql/restore/"

# Parameter zum Synchronisieren
# --delete bewirkt ein Datenabgleich inklusive Löschen auf dem Backupmedium
RSYNCCONF="--delete"

# Dateiname des Logfile
LOGFILE="/var/log/mssql_rsync.log"

# Ort der Binär-Datei von "rsync"
RSYNC=`which rsync`

# Befehl
#$RSYNC -avrpuE $RSYNCCONF $SOURCES $TARGET &gt; $LOGFILE

$RSYNC -avr -e 'sshpass -v -e ssh -p 22 -o StrictHostKeyChecking=no' ${RSYNCCONF} $SOURCES $TARGET | tee ${LOGFILE}

#exit 0
