## SOURCE CODE FOR DJANGO WEB COURSE
1. create a any empty folder to hold your django project <blogweb>

2. install django
```bash
    $ pip install django
```

3. create a django-project

```bash
    $ django-admin startproject name-of-project . eg ::: blogweb_project
```

4. runserver to confirm if django is well configured.

```bash
    $ python.exe manage.py runserver <port-number>
    # access the service at http://127.0.0.1:<port-number>
```

5. Apply Migrations
```bash
    $ python.exe manage.py migrate
```

6. create the superuser to view the admin side
```bash
    $ python.exe manage.py createsuperuser
    # prompted to enter username and password (the password is not viisble for protection)
```

7. The First Django App
```bash
    # step 1. Create The App
    $ python.exe .\manage.py startapp blog

    # Step 2. Register the app in settings.py INSTALLED_APPS = []

```

7. Models :: make migrations
```bash
    $ python.exe .\manage.py makemigrations <app-name>
    # python.exe .\manage.py makemigrations blog
```


## Deployment
8. Create Virtual Environment
```bash
    $ python.exe -m venv name-of-virtual-environment
```

Activate V.E
```bash
    $ .\enviro\Scripts\activate
    $ source enviro/bin/activate
```

create or update a requirements.txt file with package versions avalable in the virtual environment

```bash
  $ pip freeze > requirements.txt
```

(enviro) $ sudo -u postgres psql;

postgres=# CREATE DATABASE weledi_blog;
CREATE DATABASE
postgres=# GRANT ALL PRIVILEGES ON DATABASE ...... TO .....;