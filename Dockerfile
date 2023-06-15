# our base image
FROM alpine

# Install python and pip
RUN sudo apt install python3-pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY index.html /usr/src/app/templates/

# tell the port number the container should expose
EXPOSE 8090

# run the application
CMD ["python", "/usr/src/app/app.py"]
