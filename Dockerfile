FROM python:3.11

WORKDIR .

COPY ./requirements.txt /code/requirements.txt
COPY ./setup.py /code/setup.py

RUN pip install --upgrade pip

# --no-cache-dir
RUN pip install -r /code/requirements.txt
# RUN pip install -e ./

COPY . /code

# Copy .env file to the application directory
COPY .env /code/apps/ai_tutor/.env

# List the contents of the /code directory to verify files are copied correctly
RUN ls -R /code

# Change permissions to allow writing to the directory
RUN chmod -R 777 /code

# Create a logs directory and set permissions
RUN mkdir /code/apps/ai_tutor/logs && chmod 777 /code/apps/ai_tutor/logs

# Create a cache directory within the application's working directory
RUN mkdir /.cache && chmod -R 777 /.cache

WORKDIR /code/apps/ai_tutor

RUN ls -R /code

# Expose the port the app runs on
EXPOSE 7860

# Default command to run the application
CMD python -m edubotics_core.vectorstore.store_manager --config_file config/config.yml --project_config_file config/project_config.yml && python -m uvicorn app:app --host 0.0.0.0 --port 7860