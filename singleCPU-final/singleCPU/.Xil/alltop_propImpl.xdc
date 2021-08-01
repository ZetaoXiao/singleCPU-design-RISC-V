set_property SRC_FILE_INFO {cfile:c:/Users/Administrator/Desktop/singlecpu2/SingleCPU.srcs/sources_1/ip/cpuclk/cpuclk.xdc rfile:../SingleCPU.srcs/sources_1/ip/cpuclk/cpuclk.xdc id:1 order:EARLY scoped_inst:cpuclk_top/inst} [current_design]
current_instance cpuclk_top/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
