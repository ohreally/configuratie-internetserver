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
