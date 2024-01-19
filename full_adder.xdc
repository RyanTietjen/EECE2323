## Add-on board switches assigned for input
set_property -dict {PACKAGE_PIN v6 IOSTANDARD LVCMOS33} [get_ports a]
set_property -dict {PACKAGE_PIN y6 IOSTANDARD LVCMOS33} [get_ports b]
set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS33} [get_ports c_in]

## Add-on board LED's assigned for output
set_property -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS33} [get_ports sum];
set_property -dict {PACKAGE_PIN w8 IOSTANDARD LVCMOS33} [get_ports c_out];

 
