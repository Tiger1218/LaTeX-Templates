#!/usr/bin/env bash
if [[ "$EUID" -ne 0 ]]; then
	echo "Please run the script as root!"
	exit 1
fi

INSTALL_HOME=$(kpsewhich -var-value=TEXMFDIST)/tex/latex
MOV_FILES=("tiger1218.sty" "figures")

if [[ -d "$INSTALL_HOME" ]]; then
	[[ -d "$INSTALL_HOME/tiger1218" ]] && rm -r "$INSTALL_HOME/tiger1218"
	mkdir "$INSTALL_HOME/tiger1218"
	for file in "${MOV_FILES[@]}"; do
		cp -r "$file" "$INSTALL_HOME/tiger1218/"
	done
	mktexlsr
else
	echo "Please check if LaTeX was installed, or the system TeX path is set correctly!"
	exit 1
fi
