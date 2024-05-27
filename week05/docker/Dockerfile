# Basis-Image mit Python 3.10
FROM python:3.10-slim

# Setzen des Arbeitsverzeichnisses im Container
WORKDIR /app

# Kopieren der Anforderungen in das Arbeitsverzeichnis
COPY requirements.txt .

# Installieren der Abhängigkeiten
RUN pip install --no-cache-dir -r requirements.txt

# Kopieren des aktuellen Verzeichnisses in das Arbeitsverzeichnis im Container
COPY . .

# Startkommando (hier ein Platzhalter; anpassen nach Bedarf)
CMD ["python"]
