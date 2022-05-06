# Use an official Python runtime as a parent image
FROM python:3.9

# Install Python dependencies
COPY ./requirements /requirements
RUN pip install -r requirements/production.txt

# Add the rest of the code
# Collect static files
RUN mkdir staticfiles

# SECRET_KEY is only included here to avoid raising an error when generating static files
RUN DJANGO_SETTINGS_MODULE=config.settings.production \
  DJANGO_SECRET_KEY=somethingsupersecret \
  python manage.py collectstatic --noinput

COPY . .

EXPOSE $PORT

CMD python3 manage.py runserver 0.0.0.0:$PORT
