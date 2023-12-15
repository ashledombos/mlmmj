#!/bin/bash
# Wrapper pour mlmmj-sub spécifique à une liste

LIST_PATH="/var/spool/mlmmj/files/__APP__"  # Modifier selon la liste
MLMMJ_SUB="/usr/local/bin/mlmmj-sub"

# Filtrer les options
OPTIONS=""
while getopts 'a:cCdfnqsh' flag; do
  case "${flag}" in
    a|c|C|d|f|n|q|s) OPTIONS="$OPTIONS -$flag ${OPTARG}" ;;
    h) echo "Usage: sub-$app [options]
Options:
-a: Email address to subscribe
-c: Send welcome mail (unless requesting confirmation)
-C: Request mail confirmation (unless switching versions)
-d: Subscribe to digest of list
-f: Force subscription (do not moderate)
-n: Subscribe to no mail version of list
-q: Be quiet (don't notify owner about the subscription)
-s: Don't send a mail to subscriber if already subscribed"
    exit 0
    ;;
    *) echo "Option invalide"; exit 1 ;;
  esac
done

# Exécuter la commande mlmmj-sub avec les options filtrées
$MLMMJ_SUB $OPTIONS -L $LIST_PATH
