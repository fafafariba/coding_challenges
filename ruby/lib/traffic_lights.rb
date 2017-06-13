# # Traffic Lights
# # 
# # Write a simulation of traffic lights. There are 2 traffic lights. One light controls north-south traffic. The second controls east-west traffic.
# # 
# # One light is red while the other light goes through the following cycle:
# # 
# # Green for 8 seconds.
# # Yellow for 3 seconds.
# # Red for 2 seconds (Thus, both lights will be red for these 2 seconds).
# # 
# # After this, the second light goes through this same cycle while the first light remains red.
# # 
# # Desired output: Print out the state of both lights at each second.
# # 
# # - The system must be unit-testable.
# # - For time, use simulated time (not real time -- don't use setInterval or setTimeout) -- a simple integer that increments is sufficient for simulating the seconds.