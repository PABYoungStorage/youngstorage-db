import subprocess
import sys
# a = input("Enter The Database Name: ")
# b = input("Password: ")
a = sys.argv[1]
print(a)
file = open("sq.txt","r+")
if a in file:
    sys.exit(0)
    print("The Name already exists")
    file.close
else:
    subprocess.run(["docker","exec","-it","eb4ddc5a4b0c","bash","-c","./root/mysql_user_creation.sh {0} {1}".format(sys.argv[1],sys.argv[2])])
    # file.write(f'\n{a}')
    print("Success")
    file.close