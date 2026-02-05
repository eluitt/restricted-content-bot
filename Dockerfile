FROM python:3.10-slim-bookworm
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt-get update \
  && apt-get install -y --no-install-recommends git curl wget ffmpeg \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -U pip wheel \
  && pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

CMD ["python3", "-m", "ggn"]
