#Note: Only works with users with a uid range of 1000-2000
#User Management Script - By mikefak
#Collects an imported/manual list of users and compares it with the users listed in /etc/passwd

from datetime import date
today = date.today() 

flag = False

while not flag:
	dec = input('Would you like to import a text file with a list of users (N for manual entry)(Y/N/q): ')
	if dec == 'Y' or dec == 'N' or dec == 'q':
		flag = True
	else:
		print ('Please enter a valid response')

if dec == 'N':
	inpusers = [input('Please enter a list of verified users: ')]
	infile = open('/etc/passwd', 'r')
	read = infile.readlines()
	naughtylist = []
	for names in read:
		nsplit = names.split(':')
		uname = nsplit[0]
		uid = eval(nsplit[2])
		if uid >= 1000 and uid <= 2000:
			for users in inpusers:
				if uname not in users:
					naughtylist.append(uname)
	if len(naughtylist) > 0:
		outfilebad = open(f'unverified-users {today}', 'w')
		print ()
		print (f'These users are not verified for this system: {naughtylist}.\n\nA text file has been created to document these users in the current working directory.')
		outfilebad.write(f'{naughtylist}')
		outfilebad.close()
	else:
		print ('There are no unverified users on this system.')
		
	infile.close()
	outfilebad.close()

if dec == 'Y':
	
	try:
		upload = input("Enter the name of the text file with the users, must be in the WD: ")
		upl = open(upload, 'r')
		infile = open('/etc/passwd', 'r')
		read = infile.readlines()
		uplr = upl.read()
		naughtylist = []
		for names in read:
			nsplit = names.split(':')
			uname = nsplit[0]
			uid = eval(nsplit[2])
			if uid >= 1000 and uid <=2000:
				if uname not in uplr:
					naughtylist.append(uname)
		if len(naughtylist) > 0:
			outfilebad = open(f'unverified-users {today}', 'w')
			print ()
			print (f'These users are not verified for this system: {naughtylist}.\n\nA text file has been created to document these users in the current working directory.')
			outfilebad.write(f'{naughtylist}')
			outfilebad.close()
			infile.close()
			upl.close()
		else:
			print('There are no unverified users on this system')
	except:
		print (f'{upload} is not a valid file name, please try again.')

if dec == 'q':
	print ('Shutting Down...')
				
			
		
