FROM python:3
#FROM python:3.8-alpine

ENV PYTHONUNBUFFERED=1

ENV PATH="/scripts:${PATH}"

RUN mkdir /code
WORKDIR /code

COPY requirements.txt /code/
RUN apt-get update -qq && apt-get install ffmpeg -y
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

COPY . /code
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

#RUN mkdir -p /code/video

#RUN adduser -D user
#RUN adduser --disabled-password --no-create-home user
#RUN chown -R user:user /vol

RUN chmod -R 755 /vol/web
#RUN chmod -R 755 /code/video
#USER user

CMD ["entrypoint.sh"]