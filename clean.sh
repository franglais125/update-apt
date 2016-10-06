#!/bin/bash

echo "Cleaning"
sudo apt-get clean
echo -e "\nAutoremoving"
sudo apt-get autoremove --purge
