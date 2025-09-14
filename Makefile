# PoC targets for testing workflow on self-hosted runner

.PHONY: check-all
check-all: poc-commit poc-marker
	@echo "=== check-all completed ==="

.PHONY: poc-commit
poc-commit:
	@echo "=== POC: commit simulation ==="
	# You can put your test commit commands here
	@echo "Simulating commit in PR..."  

.PHONY: poc-marker
poc-marker:
	@echo "=== POC: marker simulation ==="
	# Simulate writing marker to cache or logs
	@mkdir -p /tmp/.buildx-cache || true
	@echo "POC-MARKER-${GITHUB_ACTOR:-manual}-$(shell date +%s)" > /tmp/.buildx-cache/poc-marker.txt
	@ls -l /tmp/.buildx-cache
	@echo "=== END POC MARKER ==="
