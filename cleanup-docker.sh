#!/bin/bash


# Stop and remove all running containers
echo "Stopping all running containers..."
sudo docker stop $(sudo docker ps -aq) || echo "No running containers to stop."

echo "Removing all containers..."
sudo docker rm $(sudo docker ps -aq) || echo "No containers to remove."

# Remove all images
echo "Removing all Docker images..."
sudo docker rmi $(sudo docker images -q) || echo "No images to remove."

# # Check if the image is already pulled locally, if not, pull it
# echo "Checking if Docker image $IMAGE_TAG is already pulled..."
# if ! sudo docker images | grep -q "$IMAGE_TAG"; then
#     echo "Image not found locally. Pulling from Docker Hub..."
#     sudo docker pull $IMAGE_TAG
# else
#     echo "Image $IMAGE_TAG already exists locally."
# fi

# Run the new Docker image
# echo "Running the new Docker image with tag $IMAGE_TAG..."
# Make sure to remove any previous container that may have failed to stop
# sudo docker rm $(sudo docker ps -aq --filter "name=app") || echo "No previous container to remove."

# Start the container with a new name
# sudo docker run -d -p 5000:5000 --name app $IMAGE_TAG

# Optional: Clean up unused volumes (if any)
echo "Removing unused Docker volumes..."
sudo docker volume prune -f

# Optional: Clean up unused networks
echo "Removing unused Docker networks..."
sudo docker network prune -f

# echo "Docker container with image $IMAGE_TAG is running successfully!"