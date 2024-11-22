
# Define the Docker Compose configuration
cat <<EOF > docker-compose.yml
version: '3'
services:
 elasticsearch:
   image: docker.elastic.co/elasticsearch/elasticsearch:7.13.2
   environment:
     - discovery.type=single-node
   ports:
     - 9200:9200
 kibana:
   image: docker.elastic.co/kibana/kibana:7.13.2
   ports:
     - 5601:5601
   depends_on:
     - elasticsearch
EOF

# Deploy the services using Docker Compose
docker-compose up -d
