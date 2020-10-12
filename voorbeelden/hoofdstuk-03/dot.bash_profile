################################################################################
#
# Bash configuratie voor interactieve login shells.
#
# ~/.bash_profile
#
# Meer info: https://www.librobert.net/boek/internet
#
################################################################################
#
# Copyright (c) 2019 Robert LA LAU < https://www.librobert.net/ >
#
# Dit werk is gelicenseerd onder een Creative Commons Naamsvermelding 4.0 Internationaal licentie.
# Bezoek http://creativecommons.org/licenses/by/4.0/ om een kopie te zien van de licentie
# of stuur een brief naar Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
#
################################################################################
#
# Sla dit bestand op als .bash_profile in de homedirectory van elke gebruiker (inclusief root)
# of voeg ze samen, als er al een bestand met die naam bestaat.
#
# Sla dit bestand ook op als /usr/share/skel/dot.bash_profile (FreeBSD)
# of /etc/skel/.bash_profile (Linux), of voeg ze samen.
#
# Zie bash(1) voor documentatie.
#
################################################################################

# Laad ~/.bashrc, als dat bestand bestaat.
[ -f "${HOME}/.bashrc" ] && source "${HOME}/.bashrc"
