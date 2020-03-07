'''
- X IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта
- Y запрашиваемых адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта
- все ошибки c момента последнего запуска
- список всех кодов возврата с указанием их кол-ва с момента последнего запуска
'''
import re
from pprint import pprint
log = '/home/devi1/Documents/OTUS/Linux-admin_OTUS/06_bash/access-4560-644067.log'

with open(log, 'r') as f:
    regex = (
        r'(?P<ip>\S+)'
        r' - - \[(?P<time>\S+) \S+\]'
        r' "(?:GET|POST) (?P<url>\S+)'
    )
    result = re.finditer(regex, f.read())
    for match in result:
        print(match.groups())