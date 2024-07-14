import sys, os
l = input().split()
with open("test.txt", 'w') as file:
    for x in l:
        if x != "#":
            file.write(format(ord(x), '08b') + '\n')
        else:
            file.write(format(31, '08b') + '\n')
file.close()
os.system("make")
with open("out.txt", "r") as file:
    for line in file:
        print(chr((int(line, 2))), end = " ")

