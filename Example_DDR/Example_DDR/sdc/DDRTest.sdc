
#**************************************************************
# Create Clock
#**************************************************************

create_clock -period 20  -name Clk50 	[get_ports {Clk50}]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks

#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty

set_false_path -from * -to {MtDdr:u_MtDdr|rMemRstB[0]}

set_false_path -from * -to [get_clocks {DDR3_DQS_n[0]_OUT}]
set_false_path -from * -to [get_clocks {DDR3_DQS_n[1]_OUT}]
set_false_path -from * -to [get_clocks {DDR3_DQS_p[0]_OUT}]
set_false_path -from * -to [get_clocks {DDR3_DQS_p[1]_OUT}]