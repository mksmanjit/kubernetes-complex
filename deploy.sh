docker build -t mksmanjit/complex-client:latest -t mksmanjit/complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t mksmanjit/complex-server:latest -t mksmanjit/complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t mksmanjit/complex-worker:latest -t mksmanjit/complex-worker:$SHA -f ./worker/Dockerfile ./worker
docker push mksmanjit/complex-client:latest
docker push mksmanjit/complex-client:$SHA
docker push mksmanjit/complex-server:latest
docker push mksmanjit/complex-server:$SHA
docker push mksmanjit/complex-worker:latest
docker push mksmanjit/complex-worker:$SHA
kubectl apply -f k8s
kubectl set image deployment/server-deployment server=mksmanjit/complex-server:$SHA
kubectl set image deployment/client-deployment client=mksmanjit/complex-client:$SHA
kubectl set image deployment/worker-deployment worker=mksmanjit/complex-worker:$SHA