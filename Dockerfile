FROM python:3.10-slim-bookworm

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

# سیستم‌پکیج‌های لازم (کمینه)
RUN apt-get update \
  && apt-get install -y --no-install-recommends git curl wget ffmpeg \
  && rm -rf /var/lib/apt/lists/*

# پکیج‌های پایتون
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -U pip wheel \
  && pip install --no-cache-dir -r /app/requirements.txt

# کد پروژه
COPY . /app

# اجرای بات (فقط بات، نه Flask)
CMD ["python", "-m", "ggn"]
