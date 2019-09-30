# Except Wagtail Edition
Migration project of the old Django based website to Wagtail

## Links
- [Wagtail documentation](http://docs.wagtail.io)

## Requirements
- NodeJS v8.12.0
- NPM 6.4.1 or Yarn 1.10.1
- Python 3.7
- mySQL v8.0.12

## How to run the website on your local machine
- Make sure you have your mySQL server running
- Navigate to gray-unicorn in your terminal
- Run the following commands:
```
virtualenv env -p python3
source env/bin/activate
cd except_wagtail
pip3 install -r requirements.txt
```

- The following line will add all the (new) models to the database
```
python3 ./manage.py migrate
```

- After migrations start the server, and open `localhost:8000` in your browser
```
python3 ./manage.py runserver
```

- You can reach the admin on `localhost:8000/admin` with the default credentials:
```
user: bert
pass: bridgeoverWagtail1!
```