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
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
