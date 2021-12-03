import os

rel_path = os.path.dirname(__file__)
file_input = open(relPath + "\input.txt", "r")
input_raw = file_input.read()
file_input.close()
command_list = input_raw.split("\n")

hPos = 0
depth = 0

def process_command(raw_command):
    global hPos, depth

    command = raw_command.split(" ")
    distance = int(command[1])
    if (distance < 0):
        print("Invalid distance: " + str(distance))
        return
    
    if command[0] == "forward":
        hPos += distance
    elif command[0] == "down":
        depth += distance
    elif command[0] == "up":
        depth -= distance
    else:
        print("Unknown command: " + command[0])

for command in command_list:
    process_command(command)

print("Final position: " + str(hPos) + "pos " + str(depth) + "d")
print("Total: " + str(hPos * depth))