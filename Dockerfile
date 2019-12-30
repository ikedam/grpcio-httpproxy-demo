FROM python:3.7-slim

COPY requirements.txt /requirements.txt

RUN pip install -r /requirements.txt \
    && apt-get update \
    && apt-get -y --no-install-recommends install curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY wait-firestore.sh firestore.py /app/

ENTRYPOINT ["/bin/bash", "/app/wait-firestore.sh"]

CMD ["python", "/app/firestore.py"]
