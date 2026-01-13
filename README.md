Zero-Downtime Deployment Using Docker Compose & Nginx

This project demonstrates a zero-downtime deployment strategy using Docker Compose and Nginx as a reverse proxy. Two versions of a UI-based web application (v1 and v2) are run in parallel, and traffic is switched between them without stopping the service.

Problem Statement

In a traditional deployment approach, the existing application is stopped before deploying a new version. This results in service downtime and a poor user experience.

This project addresses the problem by running multiple versions of the application simultaneously and using a reverse proxy to manage traffic routing.

Technologies Used

Docker
Docker Compose
Nginx
HTML and CSS (Basic UI)

Architecture Overview

User requests are sent to Nginx, which acts as a reverse proxy. Nginx forwards traffic to either the old or new version of the application. Users are not directly exposed to the application containers.

Flow:
User → Nginx → Application (v1 or v2)

Project Structure

The project consists of a Docker Compose file, two application directories representing different versions of the same UI-based web application, and an Nginx configuration directory used for traffic routing.

How It Works

Two versions of the application are started at the same time using Docker Compose. Nginx initially routes all incoming traffic to the first version of the application.

During deployment, the new version is already running in parallel. Traffic is switched to the new version by updating the Nginx upstream configuration and reloading Nginx. Since Nginx reloads its configuration without stopping the service, users experience no downtime.

The old version remains running, making rollback instant if required.

Commands Used

Docker Compose is used to build and start all services. Docker commands are used to verify running containers. The Nginx configuration file is edited to switch traffic between application versions. Nginx is reloaded to apply the changes without restarting the service. Docker Compose can be used to stop and clean up the containers if needed.

Rollback Strategy

Rollback is achieved by switching the Nginx configuration back to the old application version and reloading Nginx. Since both versions run simultaneously, rollback does not require container restarts and happens instantly.

Key Benefits

Zero downtime during deployments
Parallel application versions
Traffic control using Nginx
Instant rollback capability
Beginner-friendly and production-oriented approach

Conclusion

This project demonstrates how Docker Compose and Nginx can be used together to implement zero-downtime deployments. By separating traffic management from application containers, deployments become safer, more reliable, and easier to manage without service interruption.
