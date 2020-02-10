# **Задание**
- добавить в Vagrantfile еще дисков
- сломать/починить raid
- собрать R0/R5/R10 на выбор
- прописать собранный рейд в конф, чтобы рейд собирался при загрузке
- создать GPT  раздел и 5 партиций

- доп. задание - Vagrantfile, который сразу собирает систему с подключенным рейдом
- перенести работающую систему с одним диском на RAID 1. Даунтайм на загрузку с нового диска предполагается. В качестве проверки принимается вывод команды lsblk до и после и описание хода решения (можно воспользоваться утилитой Script).


## Решение
### Собрать RAID
Занулим на всякий случай суперблоки:
`mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}`

Создаем RAID:
`mdadm --create --verbose /dev/md0 -l 6 -n 5/dev/sd{b,c,d,e,f}`

Проверка:
`cat /proc/mdstat`

`mdadm -D /dev/md0`

### Создать конфиг
Для того, чтобы быть уверенным что ОС запомнила какой RAID массив требуется создать и какие компоненты в него входят создадим файл mdadm.conf
`echo "DEVICE partitions" > /etc/mdadm/mdadm.conf`
`mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf`


### Проверка работоспособности
Искусственно фэйлим один диск
`mdadm /dev/md0 --fail /dev/sde`
Проверяем
`cat /proc/mdstat`
`mdadm -D /dev/md0`
Удаляем диск из массива
`mdadm /dev/md0 --remove /dev/sde`
Вставляем новый диск
`mdadm /dev/md0 --add /dev/sde`

### Создать FS
Создаем GPT раздел
`parted -s /dev/md0 mklabel gpt`
Разделы:
`parted /dev/md0 mkpart primary ext4 0% 20%`
`parted /dev/md0 mkpart primary ext4 20% 40%`
`parted /dev/md0 mkpart primary ext4 40% 60%`
`parted /dev/md0 mkpart primary ext4 60% 80%`
`parted /dev/md0 mkpart primary ext4 80% 100%`
Создаем FS
`for i in $(seq 1 5); do sudo mkfs.ext4 /dev/md0p$i; done`
Монтируем
`mkdir -p /raid/part{1,2,3,4,5}`
`for i in $(seq 1 5); do mount /dev/md0p$i /raid/part$i; done`
