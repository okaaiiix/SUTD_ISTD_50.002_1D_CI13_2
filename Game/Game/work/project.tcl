set projDir "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/vivado"
set projName "Game"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/au_top_0.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/modulo_1.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/alu_2.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/reset_conditioner_3.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/random_4.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/edge_detector_5.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/button_conditioner_6.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/multi_seven_seg_7.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/counter_8.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/adder_9.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/shifter_10.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/boolean_11.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/comparator_12.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/pipeline_13.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/counter_14.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/seven_seg_15.v" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/verilog/decoder_16.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/work/constraint/custom.xdc" "C:/Users/User/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/Game/constraint/ALU.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
