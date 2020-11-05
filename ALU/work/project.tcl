set projDir "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/vivado"
set projName "ALU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/au_top_0.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/alu_1.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/reset_conditioner_2.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/multi_seven_seg_3.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/counter_4.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/adder_5.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/shifter_6.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/boolean_7.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/comparator_8.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/counter_9.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/seven_seg_10.v" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/verilog/decoder_11.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/constraint/alchitry.xdc" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/constraint/ALU.xdc" "C:/Users/admin/Desktop/TestFPGA\ file\ 0211/ALU/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
