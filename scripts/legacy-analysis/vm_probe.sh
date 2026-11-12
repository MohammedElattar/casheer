#!/usr/bin/env bash
# Read-only probe of the Oracle 12c Windows VM over SSH.
# No installs. No DB login. No destructive commands.
#
# Usage:
#   SSH_HOST=dobat12c_win_server bash scripts/legacy-analysis/vm_probe.sh
set -u

HOST="${SSH_HOST:-dobat12c_win_server}"
SSH_OPTS="-o BatchMode=yes -o ConnectTimeout=8 -o StrictHostKeyChecking=accept-new"

echo "=== VM probe: $HOST ==="
echo "Timestamp (UTC): $(date -u +%FT%TZ)"
echo

echo "=== SSH reachability ==="
if ! ssh $SSH_OPTS "$HOST" "echo __vm_reachable__" 2>&1; then
    echo
    echo "SSH probe FAILED."
    exit 2
fi
echo

run_remote() {
    local label="$1"; shift
    echo "----- $label -----"
    ssh $SSH_OPTS "$HOST" "$@" 2>&1
    echo
}

run_remote "OS version" "ver"
run_remote "hostname" "hostname"
run_remote "whoami" "whoami"
run_remote "ORACLE_HOME env" "echo ORACLE_HOME=%ORACLE_HOME%"
run_remote "TNS_ADMIN env"   "echo TNS_ADMIN=%TNS_ADMIN%"
run_remote "PATH"            "echo PATH=%PATH%"

for tool in frmcmp frmcmp.exe frmf2xml frmf2xml.exe \
            ifbld60 ifbld60.exe f60gen f60gen.exe ifrun60 ifrun60.exe \
            rwconverter rwconverter.exe rwrun60 rwrun60.exe rwbld60 \
            sqlplus sqlplus.exe imp imp.exe exp exp.exe \
            impdp impdp.exe expdp expdp.exe tnsping; do
    run_remote "where $tool" "where $tool 2>nul & echo __end__"
done

run_remote "sqlplus -V"       "sqlplus -V"
run_remote "tnsnames locate"  "dir /b /s C:\\tnsnames.ora 2>nul & dir /b /s %ORACLE_HOME%\\network\\admin\\tnsnames.ora 2>nul"
run_remote "C:\\oracle dir"   "dir C:\\oracle 2>nul"
run_remote "C:\\app dir"      "dir C:\\app 2>nul"
run_remote "C:\\dev6i check"  "if exist C:\\devsuite (echo YES_devsuite & dir C:\\devsuite /ad /b) else echo NO_devsuite"
run_remote "forms 6i scan"    "dir /b /s C:\\*ifbld60* 2>nul & dir /b /s C:\\*f60gen* 2>nul & dir /b /s C:\\*frmcmp* 2>nul"

echo "=== probe end ==="
