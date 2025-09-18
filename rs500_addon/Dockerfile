# Starten mit einem geeigneten Basis-Image für Python
FROM python:3.10-slim

# Installieren von hidapi-Abhängigkeiten und anderen Systempaketen
RUN apt-get update && apt-get install -y \
    libhidapi-hidraw0 \
    libusb-1.0-0 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Setzen des Arbeitsverzeichnisses im Container
WORKDIR /app

# Kopieren der Python-Abhängigkeiten und installieren dieser
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopieren der Skripte und der udev-Regeln in den Container
COPY raumklima.py .
COPY run.sh .
COPY raspi-udev.rules /etc/udev/rules.d/99-raspi-hidraw.rules

# Sicherstellen, dass das run.sh Skript ausführbar ist
RUN chmod +x /app/run.sh

# Befehl, der beim Start des Containers ausgeführt wird
CMD ["/app/run.sh"]
