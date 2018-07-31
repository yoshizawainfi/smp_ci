# smp_ci
sample ci

### docker build
docker build --no-cache=true -t smp_ci:latest -f ./ops/Dockerfile .  
docker build -t smp_ci:latest -f ./ops/Dockerfile .

### docker run
docker-compose -f ./ops/docker-compose.yml up -d
