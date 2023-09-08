#!/bin/bash
#
# Automatisches Sichern von speziellen anzugebenden Ordner
# mit Hilfe von "rsync" und cronjob
#
# Angabe der Ordner die gesichert werden soll.
# ACHTUNG
# /[Ordner]/ -&gt; Inhalt des Ordners wird gesichert
# /[Ordner] -&gt; Ordner wird gesichert
SOURCES="/home/[USER]/Dokumente /home/[USER]/Downloads"

# Ziel des Backups auf dem entfernten Rechner.
# Benötigt SSH-Key-Exchange
TARGET="root@[REMOTE]:/home/backup/"

# Parameter zum Synchronisieren
# --delete bewirkt ein Datenabgleich inklusive Löschen auf dem Backupmedium
RSYNCCONF="--delete"

# Dateiname des Logfile
LOGFILE="rsync_log.log"

# Ort der Binär-Datei von "rsync"
RSYNC=`which rsync`

# Befehl
$RSYNC -avrpuE $RSYNCCONF $SOURCES $TARGET &gt; $LOGFILE

exit 0
