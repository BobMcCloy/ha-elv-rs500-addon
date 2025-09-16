# Starten Sie mit einem geeigneten Basis-Image für Python
FROM python:3.10-slim

# Installieren Sie hidapi-Abhängigkeiten und andere Systempakete
RUN apt-get update && apt-get install -y \
    libhidapi-hidraw0 \
    libusb-1.0-0 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Setzen Sie das Arbeitsverzeichnis im Container
WORKDIR /app

# Kopieren Sie die Python-Abhängigkeiten und installieren Sie diese
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopieren Sie die Skripte in den Container
COPY rs500_reader.py .
COPY run.sh .

# Stellen Sie sicher, dass das run.sh Skript ausführbar ist
RUN chmod +x /app/run.sh

# Befehl, der beim Start des Containers ausgeführt wird
CMD ["/app/run.sh"]
