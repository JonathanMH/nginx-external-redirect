FROM nginx:alpine

EXPOSE 5000

RUN mkdir -p /var/site

WORKDIR /var/site

COPY . .

# copy built files to the "production" folder that nginx serves
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
RUN chown nginx:nginx /var/www/html
RUN cp -r /var/site/public/* .

# Copy the respective nginx configuration files
RUN mkdir -p /etc/nginx/conf.d/redirects
COPY nginx_config/nginx.conf /etc/nginx/nginx.conf
COPY nginx_config/redirects/* /etc/nginx/conf.d/redirects/
COPY nginx_config/default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
