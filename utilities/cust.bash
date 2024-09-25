# Functions for validating common use-cases

_custTrim_() {
    # DESC:
    #         Convert a string to lowercase. Used through a pipe or here string.
    # ARGS:
    #         None
    # OUTS:
    #         None
    # USAGE:
    #         text=$(_lower_ <<<"$1")
    #         printf "STRING" | _lower_
    local _char=${1:-[:space:]}
    sed -e "s%[${_char//%/\\%}]*$%%" -e "s%^[${_char//%/\\%}]*%%"
}
