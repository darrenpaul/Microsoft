import subprocess
import shutil

shutil.copy2('/src/dir/file.ext', '/dst/dir/newname.ext') # complete target filename given
shutil.copy2('/src/file.ext', '/dst/dir') # target filename is /dst/dir/file.ext

subprocess.call("command1")
subprocess.call(["command1", "arg1", "arg2"])