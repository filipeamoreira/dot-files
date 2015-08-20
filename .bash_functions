## The prompt below gets ideas from the following:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt
# http://github.com/adamv/dotfiles/blob/master/bashrc
# http://wiki.archlinux.org/index.php/Color_Bash_Prompt
txtred='\[\e[0;31m\]' # Red
txtwht='\[\e[0;37m\]' # White
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldwht='\[\e[1;37m\]' # White
end='\[\e[0m\]'    # Text Reset

function parse_git {
    branch=$(__git_ps1 "%s")
    if [[ -z $branch ]]; then
        return
    fi

    local forward="⟰"
    local behind="⟱"
    local dot="•"

    remote_pattern_ahead="# Your branch is ahead of"
    remote_pattern_behind="# Your branch is behind"
    remote_pattern_diverge="# Your branch and (.*) have diverged"

    status="$(git status 2>/dev/null)"

    state=""
    if [[ $status =~ "working directory clean" ]]; then
        state=${bldgrn}${dot}${end}
    else
        if [[ $status =~ "Untracked files" ]]; then
            state=${bldred}${dot}${end}
        fi
        if [[ $status =~ "Changed but not updated" ]]; then
            state=${state}${bldylw}${dot}${end}
        fi
        if [[ $status =~ "Changes to be committed" ]]; then
            state=${state}${bldylw}${dot}${end}
        fi
    fi

    direction=""
    if [[ $status =~ $remote_pattern_ahead ]]; then
        direction=${bldgrn}${forward}${end}
    elif [[ $status =~ $remote_pattern_behind ]]; then
        direction=${bldred}${behind}${end}
    elif [[ $status =~ $remote_pattern_diverge ]]; then
        direction=${bldred}${forward}${end}${bldgrn}${behind}${end}
    fi

    branch=${txtwht}${branch}${end}
    git_bit="${bldred}[${end}${branch}${state}\
    ${git_bit}${direction}${bldred}]${end}"

    printf "%s" "$git_bit"
}

function set_titlebar {
    case $TERM in
        *xterm*|ansi|rxvt)
            printf "\033]0;%s\007" "$*"
            ;;
    esac
}

function set_prompt {
    git="$(parse_git)"

    PS1="${txtred}\u@\h${end}: ${txtred}\W${end}"
    if [[ -n "$git" ]]; then
        PS1="$PS1 $git ${bldcyn}❯❯${end} "
    else
        PS1="$PS1 ${bldcyn}❯❯${end} "
    fi
    export PS1

    set_titlebar "$USER@${HOSTNAME%%.*} $PWD"
}

g() {
    if [[ $# == '0' ]]; then
        git status
    else
        case $1 in
            fuss)
                shift
                git rebase -i HEAD~"$1";;
            *)
                git "$@";;
        esac
    fi
}

__sizeup_build_query () {
    local bool="and"
    local query=""
    for t in $@; do
	query="$query -$bool -iname \"*.$t\""
	bool="or"
    done
    echo -n "$query"
}

__sizeup_humanize () {
    local size=$1
    if [ $size -ge 1073741824 ]; then
	printf '%6.2f%s' $(echo "scale=2;$size/1073741824"| bc) G
    elif [ $size -ge 1048576 ]; then
	printf '%6.2f%s' $(echo "scale=2;$size/1048576"| bc) M
    elif [ $size -ge 1024 ]; then
	printf '%6.2f%s' $(echo "scale=2;$size/1024"| bc) K
    else
	printf '%6.2f%s' ${size} b
    fi
}

sizeup () {
    local helpstring="Show file sizes for all files with totals\n-r\treverse sort\n-[0-3]\tlimit depth (default 4 levels, 0=unlimited)\nAdditional arguments limit by file extension\n\nUsage: sizeup [-r[0123]] ext [,ext]"
    local totalb=0
    local size output reverse OPT
    local depth="-maxdepth 4"
    OPTIND=1
    while getopts "hr0123" opt; do
	case $opt in
	    r) reverse="-r " ;;
	    0) depth="" ;;
	    1) depth="-maxdepth 1" ;;
	    2) depth="-maxdepth 2" ;;
	    3) depth="-maxdepth 3" ;;
	    h) echo -e $helpstring; return;;
	    \?) echo "Invalid option: -$OPTARG" >&2; return 1;;
	esac
    done
    shift $((OPTIND-1))

    local cmd="find . -type f ${depth}$(__sizeup_build_query $@)"
    local counter=0
    while read -r file; do
	counter=$(( $counter+1 ))
	size=$(stat -f '%z' "$file")
	totalb=$(( $totalb+$size ))
	>&2 echo -ne $'\E[K\e[1;32m'"${counter}:"$'\e[1;31m'" $file "$'\e[0m'"("$'\e[1;31m'$size$'\e[0m'")"$'\r'
	# >&2 echo -n "$(__sizeup_humanize $totalb): $file ($size)"
	# >&2 echo -n $'\r'
	output="${output}${file#*/}*$size*$(__sizeup_humanize $size)\n"
    done < <(eval $cmd)
    >&2 echo -ne $'\r\E[K\e[0m'
    echo -e "$output"| sort -t '*' ${reverse}-nk 2 | cut -d '*' -f 1,3 | column -s '*' -t
    echo $'\e[1;33;40m'"Total: "$'\e[1;32;40m'"$(__sizeup_humanize $totalb)"$'\e[1;33;40m'" in $counter files"$'\e[0m'
}

# source: http://brettterpstra.com/2015/04/27/a-universal-clipboard-command-for-bash/
copy() {
    if [[ $1 =~ ^-?[hH] ]]; then

	echo "Intelligently copies command results, text file, or raw text to"
	echo "OS X clipboard"
	echo
	echo "Usage: copy [command or text]"
	echo "  or pipe a command: [command] | copy"
	return
    fi

    local output
    local res=false
    local tmpfile="${TMPDIR}/copy.$RANDOM.txt"
    local msg=""

    if [[ $# == 0 ]]; then
	output=$(cat)
	msg="Input copied to clipboard"
	res=true
    else
	local cmd=""
	for arg in $@; do
	    cmd+="\"$(echo -en $arg|sed -E 's/"/\\"/g')\" "
	done
	output=$(eval "$cmd" 2> /dev/null)
	if [[ $? == 0 ]]; then
	    msg="Results of command are in the clipboard"
	    res=true
	else
	    if [[ -f $1 ]]; then
		output=""
		for arg in $@; do
		    if [[ -f $arg ]]; then
			type=`file "$arg"|grep -c text`
			if [ $type -gt 0 ]; then
			    output+=$(cat $arg)
			    msg+="Contents of $arg are in the clipboard.\n"
			    res=true
			else
			    msg+="File \"$arg\" is not plain text.\n"
			fi
		    fi
		done
	    else
		output=$@
		msg="Text copied to clipboard"
		res=true
	    fi
	fi
    fi

    $res && echo -ne "$output" | pbcopy -Prefer txt
    echo -e "$msg"
}
