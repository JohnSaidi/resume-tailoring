FROM python:3.12

# Install build tools (essential for compiling C++ code)
RUN apt-get update && apt-get install -y --fix-missing build-essential

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]