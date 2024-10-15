# import existing edubotics_app image
FROM us-central1-docker.pkg.dev/rdba882/edubotics-supervised-ml/edubotics_supervised_ml:latest

WORKDIR .

# Copy modified files
COPY ./ ./

CMD python -m uvicorn app_latest:app --host 0.0.0.0 --port 7860