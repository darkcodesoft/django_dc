# base image
FROM python:3.8
# setup environment variable
ENV HOME=/home/app/darkcode/

# set work directory
RUN mkdir -p $HOME
WORKDIR $HOME 

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip

# copy project to docker home directory
COPY . $HOME

# install dependencies
RUN pip install -r requirements.txt

# expose port
EXPOSE 8000

# start server
CMD python manage.py runserver 0.0.0.0:8000
