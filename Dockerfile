# Use the official .NET Core SDK image from Docker Hub
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project files to the container
COPY . .

# Restore dependencies and build the application
RUN dotnet restore
RUN dotnet publish -c Release -o out src/Portalen.Server

# Build the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

# Set the working directory in the container
WORKDIR /app

# Copy the compiled application from the build stage
COPY --from=build /app/out .

# Expose port 80 to the outside world
EXPOSE 8000

ENV ASPNETCORE_URLS=http://+:8000

# Command to run the application
ENTRYPOINT ["dotnet", "Portalen.Server.dll"]
