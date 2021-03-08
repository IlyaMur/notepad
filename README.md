# Записная книжка

###### tested: ruby 3.0

#### Описание
CLI-утилита написанная на Руби. Использованы базовые концепции ООП, реализована поддержка SQLite3.

Поддерживаются три типа записей:
* Мемо
* Ссылка
* Задача

#### Чтобы сделать заметку:
```$ ruby new_post.rb```

#### Чтобы красиво вывести заметки:
```$ ruby read.rb```

#### Как использовать?
При запуске через new_post.rb необходимо выбрать желаемую запись из списка и следовать инструкциям.
У read.rb имеются опциональные ключи:
```--type``` - какой тип постов показывать 
```--id``` - показать подробнее конкретный id
```--limit``` - сколько последних постов показать 

#### Куда сохраняются заметки?
SQLite находится в директории data
