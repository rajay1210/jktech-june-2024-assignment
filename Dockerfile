FROM python:3.11-bullseye AS app-base

WORKDIR /app

RUN adduser --home /app --system --group jktech_grp

ENV PATH=/app/.local/bin:$PATH

RUN mkdir .local .cache \
    && chown jktech_grp:jktech_grp .local \
    && chown jktech_grp:jktech_grp .cache

USER jktech_grp
WORKDIR /app

COPY --chown=jktech_grp:jktech_grp . /app
RUN python -m pip install --upgrade pip \
    && python -m pip install --upgrade setuptools \
    && python -m pip install --upgrade wheel \
    && python -m pip install -r requirements.txt

EXPOSE 7000

FROM app-base AS test-service
CMD ["gunicorn", "-c", "config.py", "app:app"]
