FROM nginx:1.9
MAINTAINER Nick Janetakis <nick.janetakis@gmail.com>

RUN rm /usr/share/nginx/html/*

COPY configs/nginx.conf /etc/nginx/nginx.conf
COPY configs/default.conf /etc/nginx/conf.d/default.conf

COPY /tmp/source/certs/productionexample.crt /etc/ssl/certs/productionexample.crt
COPY /tmp/source/certs/productionexample.key /etc/ssl/private/productionexample.key
COPY /tmp/source/certs/dhparam.pem /etc/ssl/private/dhparam.pem

COPY docker-entrypoint /
RUN chmod +x /docker-entrypoint
ENTRYPOINT ["/docker-entrypoint"]

CMD ["nginx", "-g", "daemon off;"]
