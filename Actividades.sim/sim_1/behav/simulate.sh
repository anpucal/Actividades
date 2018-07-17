#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim two_stage_referee_tb_behav -key {Behavioral:sim_1:Functional:two_stage_referee_tb} -tclbatch two_stage_referee_tb.tcl -log simulate.log
