# 01. Kernel
### Utilites & man pages
- man 2 fstat
- mmap
- mprotect

- [Ядро и функции](https://pustovoi.ru/2010/1033)
---
# 02. Disk, RAID
- [Grub 2 supports Linux mdraid volumes natively.](https://unix.stackexchange.com/questions/17481/grub2-raid-boot)
- part-type важен только для MBR разделов. В GPT всегда primary
- [перенос дескрипторов рабочих процесов](https://www.redpill-linpro.com/sysadvent/2015/12/04/changing-a-process-file-descriptor-with-gdb.html)
- [inodes](https://pustovoi.ru/2019/3053)
---
# 03. LVM, FS

- Copy on write snapshot
- Thin provisioning
- LVM stripes
- device mapper
- Почиттаь про LVM Snapshot
- overbooking
- [block. superblock. inode. hardlink.](https://unix.stackexchange.com/questions/4402/what-is-a-superblock-inode-dentry-and-a-file). Суперблок находится в 1024 байтах от начала раздела
- где хранятся inodes? Каков их размер?: [Индексные дескрипторы объединены в таблицу, которая содержится в начале каждой группы блоков](https://ru.wikipedia.org/wiki/Ext2#%D0%A1%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0_%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%D0%BE%D0%B3%D0%BE_%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B0). [Обычно при создании файловой системы примерно 1 % её объёма выделяется под индексные дескрипторы](https://ru.wikipedia.org/wiki/Inode#%D0%9F%D0%BE%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%BE%D1%81%D1%82%D0%B8) 
- где устанавливается кол-во inodes
- reserved block count - зарезервированные 5% блоков диска. Изменяемо

### Utilites & man pages
dumpe2fs, lsblk, blkid, pdflush, man hier, man fsync, man 2 sync, tune2fs, stat, ncdu, lsof, fuser, fsck, mkfs, mount, blockdev, debugfs, xfs_info, mount, ls -i, find

- [LVM Cache](http://man7.org/linux/man-pages/man7/lvmcache.7.html)
- [sysfs](http://man7.org/linux/man-pages/man5/sysfs.5.html#NOTES)
- [inodes](https://pustovoi.ru/2019/3053)

В современных системах имеет смысл выделять при установке:
/           - 8G
/home - 8G
/var      - 16G

Для приложений стоит выделять отдельные тома (например для mysql - отдельный том в /var/lib/mysql)

Block - единица измерения данных на блочном устройстве. Диск оперирует блоками. Файл любого размера не может занимать меньше одного блока.
Superblock - информация о ФС:
- размер ФС
- размер блока
- битмап занятых блоков
- расположение и размер групп блоков и таблиц inode

Inode (индексный дескриптор) - информация о файле:
- размер файла в байтах
- идентификатор владельца файла
- идентификатор группы-владельца файла
- режим доступа к файлу, определяющий кто и какой доступ имеет к файлу
- дополнительные системные и пользовательские флаги, которые дополнительно могут ограничивать доступ к файлу и его модификацию
- временные метки, отражающие время модификации индексного дескриптора (ctime, changing time), время модификации содержимого файла (mtime, modification time) и время последнего доступа к файлу (atime, access time)
- счётчик для учёта количества жёстких ссылок на файл
- указатели на физические блоки диска, в которых хранится содержимое файла

