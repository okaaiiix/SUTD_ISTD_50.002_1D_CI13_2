set projDir "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/vivado"
set projName "gamedraft"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/au_top_0.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/reset_conditioner_1.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/edge_detector_2.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/button_conditioner_3.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/externalfsm_4.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/multi_seven_seg_5.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/pipeline_6.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/counter_7.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/counter_8.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/seven_seg_9.v" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/verilog/decoder_10.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/constraint/ALU.xdc" "C:/Users/admin/Documents/GitHub/SUTD_ISTD_50.002_1D_CI13_2/Game/gamedraft/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
