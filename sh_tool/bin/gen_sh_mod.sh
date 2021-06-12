#!/bin/bash
#
# @brief   Generating Bash Script Module
# @version ver.1.0
# @date    Wed May 11 13:00:19 CEST 2016
# @company Frobas IT Department, www.frobas.com 2016
# @author  Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
UTIL_ROOT=/root/scripts
UTIL_VERSION=ver.1.0
UTIL=${UTIL_ROOT}/sh_util/${UTIL_VERSION}
UTIL_LOG=${UTIL}/log

.    ${UTIL}/bin/devel.sh
.    ${UTIL}/bin/usage.sh
.    ${UTIL}/bin/check_root.sh
.    ${UTIL}/bin/check_tool.sh
.    ${UTIL}/bin/logging.sh
.    ${UTIL}/bin/load_conf.sh
.    ${UTIL}/bin/load_util_conf.sh
.    ${UTIL}/bin/progress_bar.sh

GEN_SH_MOD_TOOL=gen_sh_mod
GEN_SH_MOD_VERSION=ver.1.0
GEN_SH_MOD_HOME=${UTIL_ROOT}/${GEN_SH_MOD_TOOL}/${GEN_SH_MOD_VERSION}
GEN_SH_MOD_CFG=${GEN_SH_MOD_HOME}/conf/${GEN_SH_MOD_TOOL}.cfg
GEN_SH_MOD_UTIL_CFG=${GEN_SH_MOD_HOME}/conf/${GEN_SH_MOD_TOOL}_util.cfg
GEN_SH_MOD_LOG=${GEN_SH_MOD_HOME}/log

declare -A GEN_SH_MOD_USAGE=(
    [Usage_TOOL]="${GEN_SH_MOD_TOOL}"
    [Usage_ARG1]="[MODULE NAME] Name of Bash Script Module (file name)"
    [Usage_EX_PRE]="# Create FileCheck module"
    [Usage_EX]="${GEN_SH_MOD_TOOL} FileCheck"
)

declare -A GEN_SH_MOD_LOGGING=(
    [LOG_TOOL]="${GEN_SH_MOD_TOOL}"
    [LOG_FLAG]="info"
    [LOG_PATH]="${GEN_SH_MOD_LOG}"
    [LOG_MSGE]="None"
)

declare -A PB_STRUCTURE=(
    [BW]=50
    [MP]=100
    [SLEEP]=0.01
)

TOOL_DEBUG="false"
TOOL_LOG="false"
TOOL_NOTIFY="false"

#
# @brief  Main function 
# @param  Value required name of bash script module
# @retval Function __gen_sh_module exit with integer value
#            0   - tool finished with success operation
#            128 - missing argument(s) from cli
#            129 - failed to load tool script configuration from files
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# local MN="FileCheck"
# __gen_sh_module "${MN}"
#
function __gen_sh_module {
    local MN=$1
    if [ -n "${MN}" ]; then
        local FUNC=${FUNCNAME[0]} MSG="None"
        local STATUS_CONF STATUS_CONF_UTIL STATUS
        MSG="Loading basic and util configuration!"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_MOD_TOOL"
        progress_bar PB_STRUCTURE
        declare -A config_gen_sh_mod=()
        load_conf "$GEN_SH_MOD_CFG" config_gen_sh_mod
        STATUS_CONF=$?
        declare -A config_gen_sh_mod_util=()
        load_util_conf "$GEN_SH_MOD_UTIL_CFG" config_gen_sh_mod_util
        STATUS_CONF_UTIL=$?
        declare -A STATUS_STRUCTURE=(
            [1]=$STATUS_CONF [2]=$STATUS_CONF_UTIL
        )
        check_status STATUS_STRUCTURE
        STATUS=$?
        if [ $STATUS -eq $NOT_SUCCESS ]; then
            MSG="Force exit!"
            info_debug_message_end "$MSG" "$FUNC" "$GEN_SH_MOD_TOOL"
            exit 129
        fi
        TOOL_DEBUG=${config_gen_sh_mod[DEBUGGING]}
        TOOL_LOG=${config_gen_sh_mod[LOGGING]}
        TOOL_NOTIFY=${config_gen_sh_mod[EMAILING]}
        local DATE=$(date) V=${config_gen_sh_mod_util[VERSION]}
        local COMPANY=${config_gen_sh_mod_util[COMPANY]} SHF="${MN}.sh"
        local AN=${config_gen_sh_mod_util[AUTHOR_NAME]} H="#" SHML TREE
        local AE=${config_gen_sh_mod_util[AUTHOR_EMAIL]}
        local MT=${config_gen_sh_mod_util[MODULE_TEMPLATE]}
        local MTF="${GEN_SH_MOD_HOME}/conf/${MT}" T="    "
        local UMN=$(echo ${MN} | tr 'a-z' 'A-Z')
        MSG="Generating file [${SHF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_MOD_TOOL"
        while read SHML
        do
            eval echo "${SHML}" >> ${SHF}
        done < ${MTF}
        MSG="Set owner!"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_MOD_TOOL"
        local USRID=${config_gen_sh_mod_util[USERID]}
        local GRPID=${config_gen_sh_mod_util[GROUPID]}
        eval "chown ${USRID}.${GRPID} ${SHF}"
        MSG="Set permission!"
        info_debug_message "$MSG" "$FUNC" "$GEN_SH_MOD_TOOL"
        eval "chmod 700 ${SHF}"
        MSG="Generated shell module [${SHF}]"
        GEN_SH_MOD_LOGGING[LOG_FLAG]="info"
        GEN_SH_MOD_LOGGING[LOG_MSGE]="$MSG"
        logging GEN_SH_MOD_LOGGING
        info_debug_message_end "Done" "$FUNC" "$GEN_SH_MOD_TOOL"
        TREE=$(which tree)
        check_tool "${TREE}"
        STATUS=$?
        if [ $STATUS -eq $SUCCESS ]; then
            eval "${TREE} -L 3 ."
        fi
        exit 0
    fi
    usage GEN_SH_MOD_USAGE
    exit 128
}

#
# @brief   Main entry point
# @param   Value required shell module name
# @exitval Script tool gen_sh_mod exit with integer value
#            0   - tool finished with success operation
#            127 - run tool script as root user from cli
#            128 - missing argument(s) from cli
#            129 - failed to load tool script configuration from files
#
printf "\n%s\n%s\n\n" "${GEN_SH_MOD_TOOL} ${GEN_SH_MOD_VERSION}" "`date`"
check_root
STATUS=$?
if [ $STATUS -eq $SUCCESS ]; then
    __gen_sh_module $1
fi

exit 127

