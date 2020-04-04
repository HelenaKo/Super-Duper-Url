#иногда пишут версию ubuntu
FROM python:3.6.9

#создается папка
RUN mkdir -p /home/app/
#куда будет установлено изображение
WORKDIR /home/app

#передает файлы с компьютера в файловую систему контейнера
COPY requirements.txt requirements.txt

#RUN эквиволентна командной строке
RUN pip install --upgrade pip && pip install -r requirements.txt
RUN install gunicorn pymysql

#устанавливают приложение в контейнер путем копирования пакета приложения
COPY migrations migrations
COPY static static
COPY templates templates
COPY db.sqlite3 db.sqlite3
COPY config.py config.py
COPY main.py main.py 

#переменная среды контейнера в compose
ENV FLASK_APP main.py

EXPOSE 5000
