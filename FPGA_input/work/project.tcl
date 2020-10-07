set projDir "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/FPGA_input/work/vivado"
set projName "FPGA_input"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/FPGA_input/work/verilog/au_top_0.v" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/FPGA_input/work/verilog/full_adder_1.v" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/FPGA_input/work/verilog/reset_conditioner_2.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/FPGA_input/work/constraint/custom.xdc" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/FPGA_input/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
