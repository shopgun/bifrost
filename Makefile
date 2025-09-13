# Temporary PoC: single-shell run that writes and prints a marker (PR-only)
.PHONY: run-poc
run-poc:
	@mkdir -p /tmp/.buildx-cache || true; \
	MARKER="POC-PR-MARKER-$${GITHUB_ACTOR:-manual}-$$(date +%s)"; \
	echo "$$MARKER" > /tmp/.buildx-cache/$$MARKER || true; \
	echo "=== POC: WROTE MARKER INTO CACHE: $$MARKER ==="; \
	echo "=== POC: LIST CACHE CONTENTS ==="; \
	ls -l /tmp/.buildx-cache | grep POC-PR-MARKER || true; \
	echo "=== END POC ==="

# Temporarily override check-all in PR so CI's `make check-all` runs the PoC
# (REMOVE this override after your test)
.PHONY: check-all
check-all: run-poc
