# Файл сценарий для отладчика третьего скрипта
#Запускаем отладчик в командной строке
perl -d Script3.pl
#смотрим подключенные модули,чтобы у нас распечатывалось с Data::Dumper и DDP
M
#смотрим наш код
l
#установим точку останова на 15 строчку,где у нас начинается цикл while(<$input_file>)
b 15
#запускаем программу
c
#Сработала точка останова
main::(Script3.pl:15): @lines=split(/:/, $_);
#Идём дальше
n
#Хотим посмотреть,что у нас в массиве @lines
DB<9> print @lines
112345
#Захотели понаблюдать за переменной $lines[0]
w $lines[0]
DB< 0 >
n Watchpoint 0: $lines[0] changed:
old value: ''
new value: '11'
main::((Script3.pl:16): push @Table, @lines;
#Всё Ок, идем дальше
n
#Смотрим,что в массиве @Table, скажем, первый его элемент
DB<10> print $Table[0]
11
#Ой,вдруг не понравилось что-то? Или забыли посмотреть? Еще раз повторим предыдущую команду(или какую хотим,указали номер)
! 10
#Идём дальше
n
#Сняли наблюдение с переменной $lines[0]
W $lines[0]
#...и дальше
n
#..и дальше
n
#и так пока не пройдем весь файл и не убедимся,что всё работает правильно
#Или сразу жмем,чтобы выйти из подпрогаммы
r
#Выходим из отладчика
q
#Или же делаем рестарт,если не отладили,назначая все команды(точки останова и другое заново)
R
