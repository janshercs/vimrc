# Git
unalias gcl
gcl() {
	git checkout $(git branch | fzf)
}
gcr() {
	  local branches branch
	  branches=$(git branch --all | grep -v HEAD) &&
	  branch=$(echo "$branches" |
		   fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
	  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# foodpanda workflow
bof() {
	if [ "$1" != "-p" ]; then
		open https://"$1"-st.fd-admin.com/default/dashboard/index
		return 0
	fi
	open https://"$2".fd-admin.com/default/dashboard/index
}
