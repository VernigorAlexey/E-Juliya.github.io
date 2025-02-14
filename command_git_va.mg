Консольные команды

Создать новый репозиторий
git init # создать новый проект в текущей папке

git init folder-name # создать новый проект в указанной папке

Клонирование репозитория
git clone git@github.com:nicothin/web-design.git # клонировать удаленный репозиторий в одноименную папку

git clone git@github.com:nicothin/web-design.git foldername # клонировать удаленный репозиторий в папку «foldername»

git clone git@github.com:nicothin/web-design.git . # клонировать репозиторий в текущую папку


Добавление файлов к отслеживанию, индексация отслеживаемых
git add text.txt # добавить к отслеживанию этот существующий файл

git add . # добавить к отслеживанию все новые файлы из текущей папки и её подпапок, индексировать отслеживаемые файлы

git add -i # запуск оболочки интерактивного индексирования для добавления в индекс только выбранных файлов

git add -p # поочередный просмотр файлов с показом изменений и задаваемым вопросом об отслеживании/индексировании (удобно для добавления в коммит только каких-то конкретных файлов)


Убирание файла, папки из отслеживания
git rm --cached readme.txt # удалить файл из отслеживаемых (файл останется на месте)

git rm --cached -r folder # удалить папку из отслеживаемых (папка останется на месте)


Отмена индексации
git reset HEAD # убрать из индекса все индексированные файлы

git reset HEAD text. txt # убрать из индекса указанный файл

Просмотр изменений
git diff # посмотреть непроиндексированные изменения (если есть, иначе ничего не выведет)

git diff --staged # посмотреть проиндексированные изменения (если есть, иначе ничего не выведет)

Отмена изменений
git checkout -- text.txt # ОПАСНО: отменить все изменения, внесенные в отслеживаемый файл со времени предыдущего коммита (файл не добавлен в индекс)

git checkout -- . # ОПАСНО: отменить изменения во всех непроиндексированных отслеживаемых файлах

git checkout text.txt # ОПАСНО: отменить изменения в непроиндексированном файле

Коммиты
git commit -m "Name of commit" # закоммитить отслеживаемые индексированные файлы (указано название коммита)

git commit -a -m "Name of commit" # закоммитить отслеживаемые индексированные файлы (указано название коммита, не требует git add, не добавит в коммит неотслеживаемые файлы)

git commit # закоммитить отслеживаемые индексированные файлы (откроется редактор для введения названия коммита)

git commit --amend # изменить последний коммит (Insert — режим ввода, : — командный режим; в командном режиме: :wq — сохранить и выйти)

git commit --amend -m "Новое название" # переименовать последний коммит (только если ещё не был отправлен в удалённый репозиторий)

Отмена коммитов
git revert HEAD --no-edit # создать новый коммит, отменяющий изменения последнего коммита без запуска редактора сообщения

git revert b9533bb --no-edit # создать новый коммит, отменяющий изменения указанного (b9533bb) коммита без запуска редактора сообщения (указаны первые 7 символов хеша коммита)

git reset --hard 75e2d51 # вернуть репозиторий в состояние коммита с указанным хешем ОПАСНО! пропадет вся работа, сделанная после этого коммита

Временно переключиться на другой коммит
git checkout b9533bb # временно переключиться на коммит с указанным хешем

git checkout master # вернуться к последнему коммиту в указанной ветке

Переключиться на другой коммит и продолжить работу с него
Потребуется создание новой ветки, начинающейся с указанного коммита.

git checkout -b new-branch 5589877 # создать ветку new-branch, начинающуюся с коммита 5589877

Удаление файла (просто удалить отслеживаемый файл из папки недостаточно, нужно сделать его неотслеживаемым и отправить коммит)
git rm text.txt # удалить из отслеживаемых неиндексированный файл (файл будет удален из папки)

git rm -f text.txt # удалить из отслеживаемых индексированный файл (файл будет удален из папки)

git rm -r log/ # удалить из отслеживаемых всё содержимое папки log/ (папка будет удалена)

git rm ind* # удалить из отслеживаемых все файлы с именем, начинающимся на «ind» в текущей папке (файлы будут удалены из папки)

git rm --cached readme.txt # удалить из отслеживаемых индексированный файл (файл останется на месте)

Перемещение/переименование файлов (Git не отслеживает перемещения/переименование, но пытается его угадать)
git mv text.txt test_new.txt # переименовать файл «text.txt» в «test_new.txt»

git mv readme_new.md folder/ # переместить файл readme_new.md в папку folder/ (должна существовать)

История изменений
git log -p index.html # показать историю изменений файла index.html (выход из длинного лога: Q)

git log -p -5 index.html # показать историю изменений файла index.html (последние 5 коммитов, выход из длинного лога: Q)

git log -2 # показать последние 2 коммита

git log -2 --stat # показать последние 2 коммита и статистику внесенных ими изменений

git log -p -22 # показать последние 22 коммита и внесенную ими разницу на уровне строк (выход из длинного лога: Q)

git log --pretty=format:"%h - %an, %ar : %s" -4 # показать последние 4 коммита с форматированием выводимых данных

git log --graph -10 # показать последние 10 коммитов с ASCII-представлением ветвления

git log --since=2.weeks # показать коммиты за последние 2 недели

git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short # мой формат вывода, висящий на алиасе оболочки

git log master..branch_99 # показать коммиты из ветки branch_99, которые не влиты в master

git log branch_99..master # показать коммиты из ветки master, которые не влиты в branch_99

git show 60d6582 # показать изменения из коммита с указанным хешем

git show HEAD^ # показать данные о предыдущем коммите

Ветки
git branch # показать список веток

git branch -v # показать список веток и последний коммит в каждой

git branch new_branch # создать новую ветку с указанным именем

git checkout new_branch # перейти в указанную ветку

git checkout -b new_branch # создать новую ветку с указанным именем и перейти в неё

git merge hotfix # влить в ветку, в которой находимся, данные из ветки hotfix

git branch -d hotfix # удалить ветку hotfix (если её изменения уже влиты в главную ветку)

git branch --merged # показать ветки, уже слитые с активной (их можно удалять)

git branch --no-merged # показать ветки, не слитые с активной

git branch -a # показать все имеющиеся ветки (в т.ч. на удаленных репозиториях)

git branch -m old_branch_name new_branch_name # переименовать локально ветку old_branch_name в new_branch_name

git branch -m new_branch_name # переименовать локально ТЕКУЩУЮ ветку в new_branch_name

git push origin :old_branch_name new_branch_name # применить переименование в удаленном репозитории

git branch --unset-upstream # завершить процесс переименования

Удалённые репозитории
git remote -v # показать список удалённых репозиториев, связанных с этим

git remote remove origin # убрать привязку удалённого репозитория с сокр. именем origin

git remote add origin git@github.com:nicothin/test.git # добавить удалённый репозиторий (с сокр. именем origin) с указанным URL

git remote rm origin # удалить привязку удалённого репозитория

git remote show origin # получить данные об удалённом репозитории с сокращенным именем origin

git fetch origin # скачать все ветки с удаленного репозитория (с сокр. именем origin), но не сливать со своими ветками

git fetch origin master # то же, но скачивается только указанная ветка

git checkout origin/github_branch # посмотреть ветку, скачанную с удалённого репозитория (локальной редактируемой копии не создаётся! если нужно редактировать, придётся влить)

git checkout --track origin/github_branch # создать локальную ветку github_branch (данные взять из удалённого репозитория с сокр. именем origin, ветка github_branch) и переключиться на неё

git push origin master # отправить в удалённый репозиторий (с сокр. именем origin) данные своей ветки master

git pull origin # влить изменения с удалённого репозитория (все ветки)

git pull origin master # влить изменения с удалённого репозитория (только указанная ветка)





