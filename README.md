# Various scripts
### This repo contains various scripts I have written to acomplish some basic goals in penetration testing


## 1email2rule.sh
  This script will take a file of email:password pairs and split them into separate files to aid with various brute force attacks.  This has specifically been an issue with account lockouts when a client will only allow a certain ammount of attempts per account.  This script should be run from the current working dirrectory and both the script and the pairs file must be present.  It will not alter the original pairs file.
