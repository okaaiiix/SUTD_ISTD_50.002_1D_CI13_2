set projDir "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/vivado"
set projName "ALU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/verilog/au_top_0.v" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/verilog/shifter_1.v" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/verilog/boolean_2.v" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/verilog/comparator_3.v" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/verilog/adder_4.v" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/verilog/reset_conditioner_5.v" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/verilog/counter_6.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/constraint/custom.xdc" "C:/root/SUTD/Term\ 4/50.002/SUTD_ISTD_50.002_1D_CI13_2/ALU/work/constraint/alchitry.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
