#FROM nginx:1.23.0-alpine

#COPY ./* /etc/nginx/
#COPY ./run.sh /run.sh

#ENV APP_HOST=app
#ENV APP_PORT=9000

#USER root

#RUN apk add --no-cache openssl bash
#RUN chmod +x /run.sh

#VOLUME /vol/static
#VOLUME /vol/www

#CMD ["/run.sh"]

FROM nginxinc/nginx-unprivileged:1-alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uwsgi_params

USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static

USER nginx
