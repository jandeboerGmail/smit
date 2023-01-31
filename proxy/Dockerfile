FROM nginxinc/nginx-unprivileged:1-alpine

COPY default.conf /etc/nginx/conf.d/default.conf
COPY uwsgi_params /etc/nginx/uwsgi_params
COPY smitelectra_nl_cert.pem         /etc/ssl/certs/smitelectra_nl_cert.pem
COPY smitelectra_nl_key.pem          /etc/ssl/private/smitelectra_nl_key.pem
COPY smitelektrotechniek_nl_cert.pem /etc/ssl/certs/smitelektrotechniek_nl_cert.pem
COPY smitelektrotechniek_nl_key.pem  /etc/ssl/private/smitelektrotechniek_nl_key.pem

USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static

USER nginx
