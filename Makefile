.PHONY: repomix repomix-full setup sync-rule ci

REPOMIX_DIR := tmp/repomix

# repomixを実行して用途別の全パターンを tmp/repomix/ へ出力
repomix: repomix-full

# リポジトリ全体をそのまま固める完全版
repomix-full:
	mkdir -p $(REPOMIX_DIR)
	pnpm dlx repomix --output $(REPOMIX_DIR)/repomix-full.xml

setup: sync-rule

sync-rule:
	curl -fsSL https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/main/SyncRule/run.sh | bash

ci: sync-rule
