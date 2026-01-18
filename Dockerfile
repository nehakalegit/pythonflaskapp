FROM python:3.9-slim
WORKDIR /app

# Copy requirements and install dependencies(-r is read dependencies from this file)
#Copy dependencies first, install them, then copy your source code
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source code
COPY . .

# Expose port and run app
EXPOSE 5000
CMD ["python", "app.py"]


# -------- Stage 1 --------
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# -------- Stage 2 --------
FROM python:3.9-slim
WORKDIR /app
COPY --from=0 /usr/local/lib/python3.9 /usr/local/lib/python3.9
COPY flask.py .
EXPOSE 5000
CMD ["python", "flask.py"]

