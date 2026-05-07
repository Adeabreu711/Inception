*This project has been created as part of the 42 curriculum by alde-abr.*

# Inception

## Description

Inception is a system administration and infrastructure project focused on Docker and containerization.  
The goal of the project is to build a small multi-service infrastructure using Docker Compose, following strict rules regarding security, networking, and container isolation.

The infrastructure is composed of several services running inside dedicated containers, including:

- WordPress
- NGINX
- MariaDB
- Redis
- FTP server
- Adminer
- Static website
- Minecraft server

Each service is built from a custom Dockerfile based on Debian and communicates through a Docker network.

---

# Project Architecture

## Services

### WordPress
CMS accessible through HTTPS and connected to MariaDB.

### NGINX
Reverse proxy and web server secured with TLS 1.2 / TLS 1.3.

### MariaDB
Relational database used by WordPress. Accessible only internally.

### Redis
In-memory cache used to improve WordPress performance.

### FTP Server
Allows remote file transfers to the WordPress volume.

### Adminer
Lightweight web interface used to manage the database.

### Static Website
Simple static HTML website served independently.

### Minecraft Server
Dedicated Minecraft server running inside its own container.

---

# Docker Concepts

## Virtual Machines vs Docker

### Virtual Machines
- Include a complete operating system
- Require more resources
- Slower startup time
- Strong isolation

### Docker Containers
- Share the host kernel
- Lightweight and fast
- Easier deployment
- Better scalability

Docker is more suitable for microservices and modern deployments.

---

## Secrets vs Environment Variables

### Environment Variables
- Easy to configure
- Used for non-sensitive configuration
- Visible in container configuration

### Docker Secrets
- Safer for sensitive data
- Encrypted and managed separately
- Recommended for passwords and tokens

This project mainly uses environment variables through a `.env` file.

---

## Docker Network vs Host Network

### Docker Network
- Isolated communication between containers
- Better security
- Containers communicate using service names

### Host Network
- Shares the host network directly
- Faster but less isolated
- Less secure

This project uses Docker bridge networking for service isolation.

---

## Docker Volumes vs Bind Mounts

### Docker Volumes
- Managed by Docker
- Persistent and portable
- Recommended for databases

### Bind Mounts
- Direct mapping with host filesystem
- Useful during development
- Easier file access

This project mainly uses Docker volumes for persistence.

---

# Instructions

## Requirements

- Docker
- Docker Compose

## Installation

Clone the repository:

```bash
git clone <repository_url>
cd Inception
```