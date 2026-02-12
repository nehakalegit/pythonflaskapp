


# -------- Stage 1 --------
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# -------- Stage 2 --------
FROM python:3.9-slim
WORKDIR /app
COPY --from=0 /usr/local/lib/python3.9 /usr/local/lib/python3.9
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]

