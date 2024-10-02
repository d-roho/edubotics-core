# DOES NOT WORK as intended
FROM us-central1-docker.pkg.dev/rdba882/edubotics-supervised-ml/edubotics_supervised_ml:latest

WORKDIR .

COPY ./.env ./.env
COPY ./app.py ./app.py
COPY ./public/files/students_encrypted.json ./public/files/students_encrypted.json
CMD echo modified
CMD python -m uvicorn app:app --host 0.0.0.0 --port 7860