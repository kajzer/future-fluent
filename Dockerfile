# Pull base image
FROM python:3.13-slim AS base

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt update -y && apt upgrade -y
RUN pip install --upgrade pip
RUN pip install uv==0.5.8
COPY ./requirements.txt $CODE_DIRECTORY/requirements.txt
RUN uv pip sync --system $CODE_DIRECTORY/requirements.txt

FROM base AS dev

# Set work directory
WORKDIR $CODE_DIRECTORY
COPY . .
