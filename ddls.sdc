
# Clock Definition
create_clock -name clk -period 20.0 [get_ports clk]

# Clock Uncertainty
set_clock_uncertainty 0.2 [get_clocks clk]

# Clock Transition
set_clock_transition 0.5 [get_clocks clk]

# Input Delay Constraints
set_input_delay 2.0 -clock clk [get_ports {password[*]}]
set_input_delay 2.0 -clock clk [get_ports enter]
set_input_delay 2.0 -clock clk [get_ports reset]

# Input Transition
set_input_transition 0.5 [get_ports {password[*]}]
set_input_transition 0.5 [get_ports enter]
set_input_transition 0.5 [get_ports reset]

# Output Delay Constraints
set_output_delay 2.0 -clock clk [get_ports door_unlock]
set_output_delay 2.0 -clock clk [get_ports wrong_password]

# Output Load
set_load 0.05 [get_ports door_unlock]
set_load 0.05 [get_ports wrong_password]
