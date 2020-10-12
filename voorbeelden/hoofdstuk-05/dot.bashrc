################################################################################
#
# Bash configuratie voor interactieve shells.
#
# ~/.bashrc
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
# Sla dit bestand op als .bashrc in de homedirectory van elke gebruiker (inclusief root)
# of voeg ze samen, als er al een bestand met die naam bestaat.
#
# Sla dit bestand ook op als /usr/share/skel/dot.bashrc (FreeBSD)
# of /etc/skel/.bashrc (Linux), of voeg ze samen.
#
# Zie bash(1) voor documentatie.
#
################################################################################

# Doe niets als dit geen interactieve shell is.
[ -z "${-//[^i]/}" ] && return

# Dit maakt de shell wat gebruiksvriendelijker.
shopt -s histappend checkwinsize
export FIGNORE='.bak:~'
export HISTCONTROL=ignoreboth
export LC_COLLATE=C

# Het is praktisch om een persoonlijke directory voor scripts te hebben.
[ -d "${HOME}/bin" ] && export PATH="${HOME}/bin:${PATH}"

# Standaardtoepassing om tekstbestanden te lezen.
if [ -x `which less`]; then
	export PAGER=less
else 
	export PAGER=more
fi

# Standaardtoepassing om tekstbestanden te bewerken.
if [ -x `which nano` ]; then
	export EDITOR=nano
else
	export EDITOR=vi
fi

# Commando aliassen.
alias ll='ls -lF'
alias lsl='ls -laF'
alias lsc='ls -1 | wc -l | sed -e "s/[[:blank:]]//g"'
alias lsca='ls -A1 | wc -l | sed -e "s/[[:blank:]]//g"'
#alias ls='ls -F'

# Pas de prompt en de titel van X terminals aan.
# Zie ook: https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
if [ "${PS1}" ]; then

	# Gebruiker, hostname en pad in de titelbalk.
	case ${TERM} in
		xterm*|rxvt*|Eterm|eterm)
			PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
			;;
		screen)
			PROMPT_COMMAND='echo -ne "\033_(screen)${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
			;;
		*)
			;;
	esac

	# Gebruiker, hostname en pad in de prompt; root gebruiker in kleur.
	if [ "`id -u`" = "0" ]; then
		PS1='\[\033[41m\]\[\033[01;37m\]\u@\h\[\033[00m\]:\w # '
	else
		PS1='\u@\h:\w $ '
	fi
fi

# Voorbeeld van een functie.
# Typ 'voorbeeld 1 twee ...' (zonder aanhalingstekens) op de opdrachtregel,
# wanneer dit bestand geladen is.
voorbeeld() {
	eerste=$1
	shift
	rest=$@
	echo "Het eerste argument was '${eerste}'."
	echo "De rest van de argumenten was '${rest}'."
}
