function assert_fail() {
    echo -e "\033[0;91mAssertion fail\033[0m ${1} != ${2}"
}

function assert_good() {
    echo -e "\033[0;92mAssertion good\033[0m ${1} != ${2}"
}

function assert_neq() {
    if [[ "${1}" != "${2}" ]]; then
        assert_good "${1}" "${2}"
    else
        assert_fail "${1}" "${2}"
    fi
}
function assert_eq() {
    if [[ "${1}" == "${2}" ]]; then
        assert_good "${1}" "${2}"
    else
        assert_fail "${1}" "${2}"
    fi
}

function assert_empty() {
    if [[ -z "${1}" ]]; then
        assert_good "${1}" "${2}"
    else
        assert_fail "${1}" "${2}"
    fi
}
