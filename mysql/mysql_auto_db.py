import subprocess
import sys
subprocess.run(["docker","exec","-it","70b542a92348","bash","-c","./root/db_creation.sh {sys.argv[1]} {sys.argv[2]}"])