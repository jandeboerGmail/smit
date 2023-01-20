FROM nginxinc/nginx-unprivileged:1-alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./key.pem      /root/ssl/key.pem
COPY ./cert.pem     /root/ssl/cert.pem

USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static

USER nginx

