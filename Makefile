poc-write-cache-marker:
	mkdir -p /tmp/.buildx-cache || true
	echo "POC-PR-MARKER-$${GITHUB_ACTOR:-manual}-$(shell date +%s)" > /tmp/.buildx-cache/poc-pr-marker-$(shell date +%s) || true
	# also print for logs:
	cat /tmp/.buildx-cache/poc-pr-marker* || true
