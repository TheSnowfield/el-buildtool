#!/bin/sh -l

echo "INPUT_FILE: $INPUT_FILE"
echo "INPUT_QUIET: $INPUT_QUIET"
echo "INPUT_PASSWORD: $INPUT_PASSWORD"
echo "INPUT_OPT_FAST_ARRAY: $INPUT_OPT_FAST_ARRAY"
echo "INPUT_OPT_CHECK_STACK: $INPUT_OPT_STACK_CHECK"
echo "INPUT_OPT_CHECK_DEADLOOP: $INPUT_OPT_DEADLOOP_CHECK"
echo "GITHUB_WORKSPACE: $GITHUB_WORKSPACE"

export TOOLCHAIN="/toolchain"
_cmd_line=""

# set password
if [ "$INPUT_QUIET" = "true" ]; then
  _cmd_line="$_cmd_line -q"
fi

# keep quiet
if [ "$INPUT_PASSWORD" != "" ]; then
  _cmd_line="$_cmd_line -pwd \"${INPUT_PASSWORD}\""
fi

# compiler option: fast array access mode
if [ "$INPUT_OPT_FAST_ARRAY" = "true" ]; then
  _cmd_line="$_cmd_line -FastArry"
else
  _cmd_line="$_cmd_line -FastArry-"
fi

# compiler option: check stack after calling DLL
if [ "$INPUT_OPT_CHECK_STACK" = "true" ]; then
  _cmd_line="$_cmd_line -CheckDllStack"
else
  _cmd_line="$_cmd_line -CheckDllStack-"
fi

# compiler option: check deadloop
if [ "$INPUT_OPT_CHECK_DEADLOOP" = "true" ]; then
  _cmd_line="$_cmd_line -CheckLoop"
else
  _cmd_line="$_cmd_line -CheckLoop-"
fi

# start xvfb service then compile the code
$TOOLCHAIN/xvfb-ctl start && \
  $TOOLCHAIN/compile $TOOLCHAIN/el $GITHUB_WORKSPACE/$INPUT_FILE - $_cmd_line && \
  $TOOLCHAIN/xvfb-ctl stop
