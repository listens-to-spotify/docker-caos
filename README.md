# Docker-контейнер с архитекурой x86-64 для курса CAOS-EDA

## Установка

Убедиться, что установлен `docker` и `docker compose`. На MacOS его можно установить, скачав [`Docker-Desktop`](https://docs.docker.com/desktop/setup/install/mac-install/):
```
docker --version
```

Склонировать репозиторий:
```
git clone https://github.com/listens-to-spotify/docker-caos
cd docker-caos
```

## Работа в VS Code

Установите расширение `Dev Containers`. После установки откройте репозиторий как проект, `VS Code` автоматически предложит запустить `docker`-контейнер.
Если не предлагает: `Cmd + Shift + P`, в открывшейся `Command Palette` написать `Dev Containers: Reopen in Container`.

## Работа в терминале

Собрать контейнер:
```
docker compose build
```

Запустить контейнер:
```
docker compose up -d
```

Открыть терминал в контейнере:
```
docker compose exec dev bash
```

Закрыть контейнер:
```
docker compose down
```

## Настройка окружения

Чтобы иметь возможность засылать задачи из контейнера, необходимо настроить контейнер в соответствии с [`SETUP.md`](https://gitlab.qcourse.ru/caos-eda/public-2025/-/blob/main/SETUP.md?ref_type=heads) в `public` репозитории [`hse-caos`](https://gitlab.qcourse.ru/caos-eda/public-2025).
То есть создать и добавить `ssh`-ключ, проверить подключение, склонировать `private` репозиторий студента, настроить его локально и можно приступать к решению задач.

## Решение задач

В директории задания для тестирования решения пишем как обычно:
```
make test
```

## Contact
telegram: [listens_to_spotify](https://t.me/listens-to-spotify)
