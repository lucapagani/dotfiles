#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

alias ll="ls -lrt"
alias vim="nvim"
alias gconftool="gconftool-2"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=on"
alias cmake-win="cmake -D GNU_HOST=x86_64-w64-mingw32 -D CMAKE_TOOLCHAIN_FILE=~/Toolchain-mingw32.cmake"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64/
export FT2_SUBPIXEL_HINTING=1  # Infinality mode
export PATH=$PATH:/opt/anaconda/bin/:/opt/cuda/bin/

export PETSC_DIR=/opt/petsc/linux-c-opt/
export PETSC_ARCH=""
export PATH=${PATH}:${PETSC_DIR}/lib:${PETSC_DIR}/bin
export PATH="/home/luca/opt/anaconda3/bin:$PATH"

export SLEPC_DIR=/opt/slepc/linux-c-opt/
export SLEPC_ARCH=""
export PATH=${PATH}:${SLEPC_DIR}/lib:${SLEPC_DIR}/bin

export MPI_CC=/opt/intel/compilers_and_libraries_2018.3.222/linux/mpi/intel64/bin/mpicc
export MPI_CXX=/opt/intel/compilers_and_libraries_2018.3.222/linux/mpi/intel64/bin/mpicxx

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# # added by Anaconda3 2018.12 installer
# # >>> conda init >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/luca/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
    # \eval "$__conda_setup"
# else
    # if [ -f "/home/luca/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        # . "/home/luca/opt/anaconda3/etc/profile.d/conda.sh"
        # CONDA_CHANGEPS1=false conda activate base
    # else
        # \export PATH="/home/luca/opt/anaconda3/bin:$PATH"
    # fi
# fi
# unset __conda_setup
# # <<< conda init <<<
