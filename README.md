# nginx external redirect config demo

This is a fun little example of using external config files for redirects in nginx, you can read more over here: [Nginx and External Config Files for Redirects](https://jonathanmh.com/nginx-and-external-config-files-for-redirects)

## Usage

You can either build the docker file by building:

```
docker build -t nginx-external-redirect .
docker run --init -p 80:5000 -t nginx-external-redirect
```

or use docker-compose:

```
docker-compose up
```

and you can try the following URLs:

* http://localhost/
* http://localhost/old-url (will redirect)
* http://localhost/new-url
* http://localhost/deprecated (will 410)
