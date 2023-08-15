FROM python:3.7-slim as cloudmapper

# Set environment variables
ENV AWS_DEFAULT_REGION=us-east-1 

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    autoconf \
    automake \
    libtool \
    python3-tk \
    jq \
    awscli \
    bash \
    procps \
    net-tools

# Set the working directory in the container
WORKDIR /opt/cloudmapper

# Copy the project files to the working directory
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Start a bash shell by default
CMD ["bash"]