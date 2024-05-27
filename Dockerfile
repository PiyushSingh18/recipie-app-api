# FROM python:3.9-alpine3.13
# LABEL maintainer="piyush"

# ENV PYTHONUNBUFFERED 1

# COPY ./requirements.txt /tmp/requirements.txt
# COPY ./app /app
# WORKDIR /app
# EXPOSE 8000

# RUN python -m venv /py && \
#     /py/bin/pip install --upgrade pip && \
#     /py/bin/pip install -r /tmp/requirements.txt && \
#     rm -rf /tmp && \
#     adduser -D \
#         -- disabled-password \
#         --no-create-home \
#         django-user

# ENV PATH="/py/bin:$PATH"

# USER django-user
# Use Python 3.9 base image on Alpine Linux
FROM python:3.9-alpine3.13

# Set maintainer label
LABEL maintainer="piyush"

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Copy requirements.txt and application code
COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app

# Set working directory
WORKDIR /app

# Expose port 8000
EXPOSE 8000

# Install dependencies and configure non-root user
ARG DEV=false
RUN python -m venv /py \
    && /py/bin/pip install --upgrade pip \
    && /py/bin/pip install -r /tmp/requirements.txt \
    && rm -rf /tmp \
    && adduser \
        --disabled-password \
        --no-create-home \
        django-user



# Set PATH environment variable
ENV PATH="/py/bin:${PATH}"


USER django-user

