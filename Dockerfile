FROM python:3.11-bullseye AS app-base

WORKDIR /app

COPY . /app
RUN python -m pip install --upgrade pip \
    && python -m pip install --upgrade setuptools \
    && python -m pip install --upgrade wheel \
    && python -m pip install -r requirements.txt

EXPOSE 7000

FROM app-base AS test-service
CMD ["python", "app.py"]
