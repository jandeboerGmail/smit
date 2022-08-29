FROM python:3
#FROM python:3-slim-buster

ENV PYTHONUNBUFFERED=1

ENV PATH="/scripts:${PATH}"

RUN mkdir /code
WORKDIR /code

COPY requirements.txt /code/
RUN pip3 install -r requirements.txt

COPY smit/settings_dev.py /code/smit/settings.py
#COPY smit/settings_prod.py /code/smit/settings.py
#COPY smit/settings_smit.py /code/smit/settings.py
COPY . /code
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

#RUN adduser user
#RUN adduser --disabled-password --no-create-home user
#RUN chown -R user:user /vol

RUN chmod -R 755 /vol/web
#USER user

CMD ["entrypoint.sh"]
