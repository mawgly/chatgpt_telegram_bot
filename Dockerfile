FROM python:3.9-slim-buster

WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8

# Create directory for database
RUN mkdir -p /app/mongodb

# Set the command to run when the container starts
CMD ["python", "-m", "bot.bot"]