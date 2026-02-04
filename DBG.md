# Использование gdb в контейнере

Ссылка на [issue](https://github.com/listens-to-spotify/docker-caos/issues/1)

Чтобы использовать gdb, пошагово выполните следующие команды в контейнере:

```
which gdb # /usr/bin/gdb
```
```
nano /usr/local/bin/gdb
```

Туда вставить код:

```
#!/bin/bash

if [ "$#" != "1" ]; then
    echo "Usage: gdb <program>" >&2
    exit 1
fi

prog="$1"

ROSETTA_DEBUGSERVER_PORT=1234 "$prog" &

/usr/bin/gdb \
    -iex "set architecture i386:x86-64" \
    -iex "file $prog" \
    -iex "target remote localhost:1234" \
    -iex "set history save on"
```

Чтобы сохранить изменения, `^O` (^ это или `Control` или `Option` или `CMD`, хз что именно на маке), затем `Enter` (`Return`). Чтобы выйти - `^X`.

```
chmod +x /usr/local/bin/gdb
```

```
which gdb # /usr/local/bin/gdb
```

Готово. Возможно, чтобы начать выполнение файла в `gdb`, придется написать `continue`, а не `run`. 

## Список полезных комманд `gdb`


```
gcc main.S simpleio.S -g                    // берем файл для отладки
./a.out                                     // получил файл, смотрим, что в нем

gdb ./a.out                                 // запустить дебаггер
b main                                      // поставить breakpoint на метку main
run                                         // запустить приложение и перейти к первой инструкции, не выполняя ее
next                                        // исполнить следующую функцию
step                                        // войти внутрь функции
q                                           // досрочно завершить

info registers                              // вывести значения всех регистров
info register rdi                           // вывести значение регистра rdi
info register eflags                        // посмотреть выставленные флаги
layout asm                                  // просмотр инструкций подряд
objdump -D ./a.out | grep "<main>:" -A 10   // вывести 10 строк кодировки инструкций после метки main
print                                       // выполнить команду на языке C
```

## Пример отладки

```
gcc solution.S simpleio_x86_64.S -g
gdb ./a.out
c // --Type <RET> for more, q to quit, c to continue without paging--
n // Enable debuginfod for this session? (y or [n])
break main // Breakpoint 1 at 0x555555555169: file solution.S, line 5.
continue // Breakpoint 1, main () at solution.S:5 5               mov rbx, 63
next // 6               mov rsp, 0
...
next // main () at solution.S:7 7               jmp loop
quit
y // Quit anyway? (y or n)
```
