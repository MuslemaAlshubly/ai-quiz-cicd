# Base image
FROM python:3.11-slim

# Working directory
WORKDIR /app

# Copy dependency file first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of application
COPY . .

# Initialize database
RUN python -c "import db; db.init_db()"

# Environment variable
ENV PORT=5000

# Expose port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]