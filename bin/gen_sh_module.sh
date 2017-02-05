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

.	${UTIL}/bin/devel.sh
.	${UTIL}/bin/usage.sh
.	${UTIL}/bin/check_root.sh
.	${UTIL}/bin/check_tool.sh
.	${UTIL}/bin/logging.sh
.	${UTIL}/bin/load_conf.sh
.	${UTIL}/bin/load_util_conf.sh
.	${UTIL}/bin/progress_bar.sh

GEN_SH_MODULE_TOOL=gen_sh_module
GEN_SH_MODULE_VERSION=ver.1.0
GEN_SH_MODULE_HOME=${UTIL_ROOT}/${GEN_SH_MODULE_TOOL}/${GEN_SH_MODULE_VERSION}
GEN_SH_MODULE_CFG=${GEN_SH_MODULE_HOME}/conf/${GEN_SH_MODULE_TOOL}.cfg
GEN_SH_MODULE_UTIL_CFG=${GEN_SH_MODULE_HOME}/conf/${GEN_SH_MODULE_TOOL}_util.cfg
GEN_SH_MODULE_LOG=${GEN_SH_MODULE_HOME}/log

declare -A GEN_SH_MODULE_USAGE=(
	[USAGE_TOOL]="${GEN_SH_MODULE_TOOL}"
	[USAGE_ARG1]="[MODULE NAME] Name of Bash Script Module (file name)"
	[USAGE_EX_PRE]="# Create FileCheck module"
	[USAGE_EX]="${GEN_SH_MODULE_TOOL} FileCheck"
)

declare -A GEN_SH_MODULE_LOGGING=(
	[LOG_TOOL]="${GEN_SH_MODULE_TOOL}"
	[LOG_FLAG]="info"
	[LOG_PATH]="${GEN_SH_MODULE_LOG}"
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
# @param  Value required name of Bash Script Module
# @retval Function __gen_sh_module exit with integer value
#			0   - tool finished with success operation 
#			128 - missing argument(s) from cli 
#			129 - failed to load tool script configuration from files
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# NAME="FileCheck"
# __gen_sh_module "$NAME"
#
function __gen_sh_module() {
	local NAME=$1
	if [ -n "${NAME}" ]; then
		local FUNC=${FUNCNAME[0]} MSG="None" STATUS_CONF STATUS_CONF_UTIL STATUS
		MSG="Loading basic and util configuration!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_MODULE_TOOL"
		__progress_bar PB_STRUCTURE
		declare -A config_gen_sh_module=()
		__load_conf "$GEN_SH_MODULE_CFG" config_gen_sh_module
		STATUS_CONF=$?
		declare -A config_gen_sh_module_util=()
		__load_util_conf "$GEN_SH_MODULE_UTIL_CFG" config_gen_sh_module_util
		STATUS_CONF_UTIL=$?
		declare -A STATUS_STRUCTURE=(
			[1]=$STATUS_CONF [2]=$STATUS_CONF_UTIL
		)
		__check_status STATUS_STRUCTURE
		STATUS=$?
		if [ $STATUS -eq $NOT_SUCCESS ]; then
			MSG="Force exit!"
			__info_debug_message_end "$MSG" "$FUNC" "$GEN_SH_MODULE_TOOL"
			exit 129
		fi
		TOOL_DEBUG=${config_gen_sh_module[DEBUGGING]}
		TOOL_LOG=${config_gen_sh_module[LOGGING]}
		TOOL_NOTIFY=${config_gen_sh_module[EMAILING]}
		local DATE=$(date) VERSION=${config_gen_sh_module_util[VERSION]}
		local COMPANY=${config_gen_sh_module_util[COMPANY]}
		local AUTHOR=${config_gen_sh_module_util[AUTHOR]}
		local MODULE_TEMPLATE=${config_gen_sh_module_util[MODULE_TEMPLATE]}
		local HASH="#" TAB="	"
		MSG="Generating shell module [${NAME}.sh]!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_MODULE_TOOL"
		GEN_SH_MODULE_LOGGING[LOG_FLAG]="info"
		GEN_SH_MODULE_LOGGING[LOG_MSGE]="$MSG"
		__logging GEN_SH_MODULE_LOGGING
		local UMNAME=$(echo ${NAME} | tr 'a-z' 'A-Z') SHMLINE
		while read SHMLINE
		do
			eval echo "$SHMLINE" >> "${NAME}.sh"
		done < "${GEN_SH_MODULE_HOME}/conf/${MODULE_TEMPLATE}"
		MSG="Set owner!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_MODULE_TOOL"
		local USRID=${config_gen_sh_module_util[UID]}
		local GRPID=${config_gen_sh_module_util[GID]}
		eval "chown ${USRID}.${GRPID} ${NAME}.sh"
		MSG="Set permission!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_SH_MODULE_TOOL"
		eval "chmod 700 ${NAME}.sh"
		MSG="Generated shell module [${NAME}.sh]"
		GEN_SH_MODULE_LOGGING[LOG_FLAG]="info"
		GEN_SH_MODULE_LOGGING[LOG_MSGE]="$MSG"
		__logging GEN_SH_MODULE_LOGGING
		__info_debug_message_end "Done" "$FUNC" "$GEN_SH_MODULE_TOOL"
		exit 0
	fi
	__usage GEN_SH_MODULE_USAGE
	exit 128
}

#
# @brief   Main entry point
# @param   Value required shell module name
# @exitval Script tool gen_sh_module exit with integer value
#			0   - tool finished with success operation 
# 			127 - run tool script as root user from cli
#			128 - missing argument(s) from cli 
#			129 - failed to load tool script configuration from files
#
printf "\n%s\n%s\n\n" "${GEN_SH_MODULE_TOOL} ${GEN_SH_MODULE_VERSION}" "`date`"
__check_root
STATUS=$?
if [ $STATUS -eq $SUCCESS ]; then
	__gen_sh_module $1
fi

exit 127

