import subprocess
import sys
with open(r'mysql_username.txt','r+') as file:
        content = file.read()
        if sys.argv[1] in content:
            print('Username Already Exists Please Choose another one')
            file.close()
        else:
            file.write(f'\n{sys.argv[1]}')
            subprocess.run(["docker","exec","-it","1b1341960db2","bash","-c","./root/mysql_user_creation.sh {0} {1}".format(sys.argv[1],sys.argv[2])])
            print('Success You have been added')
            file.close()