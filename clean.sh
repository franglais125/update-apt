#!/bin/bash

echo "Cleaning"
sudo apt clean
echo -e "\nAutoremoving"
sudo apt autoremove --purge
