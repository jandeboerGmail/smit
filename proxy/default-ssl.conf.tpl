server {
    listen 80;
    server_name 192.168.2.62 ${DOMAIN} www.${DOMAIN};

    location /.well-known/acme-challenge/ {
        root /vol/www/;
    }

    location / {
       return 301 https://$host:9000$request_uri;
    }
}

server {
    listen      9000 ssl;
    server_name 192.168.2.62 ${DOMAIN} www.${DOMAIN};

    ssl_certificate     /etc/letsencrypt/live/${DOMAIN}/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/${DOMAIN}/privkey.pem;

    include     /etc/nginx/options-ssl-nginx.conf;

    ssl_dhparam /vol/proxy/ssl-dhparams.pem;

    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    location media {  
        #return 200 "You receiced media\n";
        alias /code/media;
        
        uwsgi_buffer_size 32k;
        uwsgi_buffers 8 32k;
        uwsgi_busy_buffers_size 32k;

        uwsgi_read_timeout 300;
        uwsgi_send_timeout 300;

        uwsgi_connect_timeout 60;
     
        #sendfile       on;
        #tcp_nopush     on;
        #aio            on;
    
       # slice 1m;

        #mp4;
        #mp4_buffer_size 1m;
        #mp4_max_buffer_size 10m;

    
        #types {
        #    video/mp4 mp4;
        #    video/webm webm;
        #}
        # Enable video scrubbing by sending appropriate headers
        #add_header Cache-Control 'no-store, no-cache, must-revalidate, max-age=0';
        #add_header Pragma 'no-cache';
        #add_header Expires '0';
        #add_header Cache-Control "public, max-age=7200";
    }

    location /static {
        alias /vol/static;
    }

    location / {
        #uwsgi_pass           ${APP_HOST}:${APP_PORT};
        uwsgi_pass app:8000;
        include              /etc/nginx/uwsgi_params;
        #Client_max_body_size 10M;
    }
}
