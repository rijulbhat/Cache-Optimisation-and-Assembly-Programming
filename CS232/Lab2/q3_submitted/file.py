import os

with open("txt.txt", 'r') as file:
	for x in file.readlines():
		with open("new_test_file.txt", 'w') as new_file:
			new_file.write(x)
		y = "python3 test_script.py < new_test_file.txt"
		os.system(y)
		print()
		print()