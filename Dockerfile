# 1. Use a slim Python base image
FROM python:3.12-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Create a non-root user and group for security
RUN groupadd -r devopsgroup && useradd -r -g devopsgroup devopsuser

# 4. Copy requirements first to leverage Docker cache
COPY requirements.txt .

# 5. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copy the rest of the application code
COPY . .

# 7. Transfer ownership of the files to the non-root user
RUN chown -R devopsuser:devopsgroup /app

# 8. Switch to the non-root user
USER devopsuser

# 9. Expose the port the app runs on
EXPOSE 8000

# 10. Command to run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
