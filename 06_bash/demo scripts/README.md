# Стенд для занятия "Bash"
[Шпаргалка по bash](https://devhints.io/bash)

## Connect to vagrant bash

```shell
vagrant ssh bash
sudo -i
yum install vim bash-completion -y
```

## Приглашения оболочки
[Сделать свое приглашение оболочки](http://ezprompt.net/)

`export PS1="[\[\e[34m\]\d\[\e[m\] - \[\e[36m\]\A\[\e[m\]\[\e[32m\]\w\[\e[m\]]\\$"`

`export PS1="\e[0;31m[\u@\h \W]\$ \e[m"`

## Приветствия

```shell
echo "echo $USER" >> ~/.bash_profile
echo "echo \$USER" >> ~/.bash_profile
echo 'echo $USER' >> ~/.bash_profile
```

```shell
alias  # посмотреть все алиасы
alias la='ls -A' # задать алиас la
alias lala='la -la' # задать новый алиас lala
```

## Переменные окружения
`env` - вывести все системные переменные

`printenv` - или так

### Установить переменную
`export var=var`

### Считать переменную
```shell
echo $var
$(ls -a)
```

## Перенаправления

```bash
mkfifo my-pipe
stat my-pipe
ls -l > my-pipe

cd /vagrant
more < my-pipe
echo "hello, my-pipe" > my-pipe
```

### EOF - запись multiline строк

```bash
tee my-notes << EOF
todo 1
todo 2
todo 3
some numbers 34435
some text fjdfjkdj
EOF

more myfile
```

## trap.sh
bash trap - классическая защита от повторного запуска процесса (кроме kill)
от случайных ребутов и падений питания - класть скрипт в /tmp или /run
upd: сейчас это лучше делать через systemd-модули

Еще один вариант:
```bash
while [ -f $pid_file ]
  do
    echo "Идет фоновый процесс - ждем 300 секунд"
    sleep 300
done
```

## regexp
Полезные сайты по регуляркам:
[regexr](https://regexr.com/)
[regex101](https://regex101.com/)

`egrep -v "^#|^$" /etc/sudoers`



## bash globbing

```bash
cd /vagrant
ls -l loop{2..4}.sh
ls -l *
```

```bash
mkdir log
cd log
for i in {1..999999};do touch log$i;done
rm -rf *    # может не заработать
find ./ -name "log*" -delete  # а это нормально работает
ls
```

## awk.sh - test.awk
```shell
awk -F":" '{ print $1" : "$7}' /etc/passwd
more /var/log/nginx/access.log | awk '{print $1" "$9}' | uniq | wc -l
more /var/log/nginx/access.log | awk '{print $1}' | uniq | wc -l
cat /var/log/nginx/access.log | awk '/GET...'

cat /etc/passwd | awk -F":" -f test.awk

awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg
```


## sed

[Игра Sokoban на SED](http://sed.sourceforge.net/local/games/sokoban.sed.html)

```shell
cd / && ls -l > out.log
sed 's/root/otus/g' out.log
more out.log
sed -i 's/root/otus/g' out.log
more out.log
```
