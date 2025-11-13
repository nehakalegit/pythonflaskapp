FROM python:3.9-slim
WORKDIR /app

# Copy requirements and install dependencies(-r is read dependencies from this file)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source code
COPY . .

# Expose port and run app
EXPOSE 5000
CMD ["python", "app.py"]
