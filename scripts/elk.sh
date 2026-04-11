#!/bin/bash

echo "Starting Elasticsearch..."
echo "Starting Kibana..."
echo "Starting Filebeat..."
echo ""

docker-compose -f ~/elk-lab/docker-compose.yml up -d

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$DISK_USAGE" -gt 80 ]; then
	    echo "WARNING: Disk usage is at ${DISK_USAGE}% - consider cleaning up before starting!"
	        echo "Run: docker system prune -f"
fi

echo ""
echo "Waiting for Elasticsearch to be ready..."
until curl -s http://localhost:9200 > /dev/null; do
	    sleep 2
    done

    echo ""
    printf "%-20s %-20s %-30s\n" "NAME" "STATUS" "PORTS"
    echo "----------------------------------------------------------------------"
docker ps -a --format "{{.Names}}|{{.Status}}|{{.Ports}}" | grep -E "elasticsearch|kibana|filebeat" | \
	while IFS='|' read -r name status ports; do
		    printf "%-20s %-20s %-30s\n" "$name" "$status" "$ports"
	    done

	    echo ""
	    echo "Kibana        -> http://$(hostname -I | awk '{print $1}'):5601"
	    echo "Elasticsearch -> http://$(hostname -I | awk '{print $1}'):9200"
	    echo ""
	    echo "All services started successfully!"
