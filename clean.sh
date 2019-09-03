#!/bin/bash

echo "Cleaning: sudo apt clean"
sudo apt clean
echo -e "\nAutoremoving: sudo apt autoremove --purge"
sudo apt autoremove --purge
