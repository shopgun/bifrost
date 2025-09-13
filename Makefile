.PHONY: run-poc
run-poc:
	@mkdir -p /tmp/.buildx-cache || true
	@MARKER="POC-PR-MARKER-$${GITHUB_ACTOR:-manual}-$(shell date +%s)"
	@echo "$$MARKER" > /tmp/.buildx-cache/$$MARKER || true
	@echo "=== POC: WROTE MARKER INTO CACHE: $$MARKER ==="
	@echo "=== POC: LIST CACHE CONTENTS ==="
	@ls -l /tmp/.buildx-cache | grep POC-PR-MARKER || true
	@echo "=== END POC ==="

check-all: run-poc format-check check-runtimes check-benchmarks check-bin
