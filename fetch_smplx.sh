#!/bin/bash                                                                                                                                                        
urle () { [[ "${1}" ]] || return 1; local LANG=C i x; for (( i = 0; i < ${#1}; i++ )); do x="${1:i:1}"; [[ "${x}" == [a-zA-Z0-9.~-] ]] && echo -n "${x}" || printf 
'%%%02X' "'${x}"; done; echo; }                                                                                                                                    
                                                                                                                                                                   
# BEDLAM checkpoints                                                                                                                                               
echo -e "\nYou need to register at https://bedlam.is.tue.mpg.de/"                                                                                                  
read -p "Username (BEDLAM):" username                                                                                                                              
read -p "Password (BEDLAM):" password
username=$(urle $username)
password=$(urle $password)

wget --post-data "username=$username&password=$password" 'https://download.is.tue.mpg.de/download.php?domain=smplx&sfile=smplx_lockedhead_20230207.zip' --no-check-certificate --continue