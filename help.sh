#!/bin/bash
less << EOF
This small collection of scripts simply tries to emulate some features from
Synaptic in the terminal.
It uses the usual available dpkg and apt commands to achieve this.
There are a few local tmp files here: "~/.update-apt/tmp/".
To uninstall this it suffices to delete "~/.update-apt".

The intended use is to simply execute "upd".
Then the script will update the package information, find available upgrades and
inform the user of any local/obsolete/residual packages to be cleaned (i.e. what
a user sees when updating from Synaptic).

Otherwise, these are the available commands:
 upd help:
 * Shows this information

 upd update
 * Executes "apt update"
 * Resynchronizes the package index files from their sources

 upd upgrade
 * Executes "apt upgrade"

 upd fupgrade
 * Executes "apt full-upgrade"

 upd upgradable
 * Executes "apt list --upgradable"
 * Shows packages that can be upgraded

 upd residual
 * Finds and shows packages with residual configuration files
 * Run "apt purge _packagename_" to clean a given package

 upd obsolete
 * Find and shows packages that are obsolete. This means that the version of a
 given installed package is no longer available in the source repositories.

 upd local
 * Find and shows packages that are local. This means that the package is no
 longer available in the source repositories.

 upd new
 * Finds and shows new packages in the repositories

 upd clean
 * Executes "apt autoremove --purge" and "apt clean"
 * This removes packages that are no longer required and removes .deb files from
 the local cache.
EOF
