#!/bin/bash
#
# Automatisches Sichern von speziellen anzugebenden Ordner
# mit Hilfe von "rsync" und cronjob
#
set -x

REMOTE=$1
PASSWORD=$2

# Angabe der Ordner die gesichert werden soll.
# ACHTUNG
# /[Ordner]/ -&gt; Inhalt des Ordners wird gesichert
# /[Ordner] -&gt; Ordner wird gesichert
SOURCES="/mssql/backup/"

# Ziel des Backups auf dem entfernten Rechner.
# Benötigt SSH-Key-Exchange
TARGET="${REMOTE}:/mssql/restore"

# Parameter zum Synchronisieren
# --delete bewirkt ein Datenabgleich inklusive Löschen auf dem Backupmedium
RSYNCCONF="--rsh='/usr/bin/sshpass -p password ${PASSWORD} -o StrictHostKeyChecking=no'"

# Dateiname des Logfile
LOGFILE="rsync_log.log"

# Ort der Binär-Datei von "rsync"
RSYNC=`which rsync`

# Befehl
$RSYNC -avrpuE $RSYNCCONF $SOURCES $TARGET &gt; $LOGFILE

#exit 0
