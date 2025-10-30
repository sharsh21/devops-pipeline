set -e

NAME="kubernetes-demo"
USERNAME="sharsh21"
IMAGE="$USERNAME/$NAME:latest"

echo "Building docker image..."
docker build -t "$IMAGE" .

echo "Pushing docker image..."
docker push "$IMAGE"

echo "Applying kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching the main service"
kubectl get services "$NAME-service"

echo "Done!"