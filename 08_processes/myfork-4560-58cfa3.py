import os, time
import sys

print('Hello! I am an example')
pid = os.fork()
print('pid of my child is %s' % pid)
if pid == 0:
    print('I am a child. Im going to sleep')
    for i in range(1,40):
      print('mrrrrr')
      a = 2**i
      print(a)
      pid = os.fork()
      if pid == 0:
            print('my name is %s' % a)
            sys.exit(0)
      else:
            print("my child pid is %s" % pid)
      time.sleep(1)
    print('Bye')
    sys.exit(0)

else:
    for i in range(1,200):
      print('HHHrrrrr')

      time.sleep(1)
      print(3**i)
    print('I am the parent')

#pid, status = os.waitpid(pid, 0)
#print "wait returned, pid = %d, status = %d" % (pid, status)

