## Git Functions

function git-commit-all(){
    if [ $1 ]; then
        git commit -m "$1"
    else
        git commit --allow-empty-messag
    fi
}
