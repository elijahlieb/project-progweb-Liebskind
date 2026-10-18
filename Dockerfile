# Utiliser une image Python légère officielle
FROM python:3.10-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier et installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code source de l'application
COPY . .

# Exposer le port sur lequel l'application s'exécute
EXPOSE 8080

# Commande pour lancer l'application
CMD ["python", "app.py"]

# build stage
FROM openjdk:21-jdk-slim as builder
WORKDIR/app
COPY ..
RUN ./gradlew clean build -x test

# Runtime stage 
FROM openjdk:21-jdk-slim 
WORKDIR /app
COPY --from=builder
/app/build/libs/*.jar app.jar

EXPOSE 8080

EBTRYPOINT ["java", "-jar", "app.jar"]
