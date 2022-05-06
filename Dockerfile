# Use an official Python runtime as a parent image
FROM python:3.9

WORKDIR /code/

# Install Python dependencies
COPY ./requirements /requirements
RUN pip install -r requirements/production.txt

# Add the rest of the code

COPY . /code

EXPOSE $PORT

CMD python3 manage.py runserver 0.0.0.0:$PORT
