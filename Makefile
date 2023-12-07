PM_RUN = pdm run
MANAGEPY_DEST = src/manage.py

.PHONY: runserver
runserver:
	@$(PM_RUN) $(MANAGEPY_DEST) runserver

.PHONY: shell
shell:
	@$(PM_RUN) $(MANAGEPY_DEST) shell -i ipython

.PHONY: migrate
migrate:
	@$(PM_RUN) $(MANAGEPY_DEST) migrate $(MIGRATION) $(APP_NAMES)

.PHONY: makemigrations
makemigrations:
	@$(PM_RUN) $(MANAGEPY_DEST) makemigrations $(APP_NAMES)

.PHONY: black
black:
	@$(PM_RUN) black src

.PHONY: isort
isort:
	@$(PM_RUN) isort src

.PHONY: ruff
ruff:
	@$(PM_RUN) ruff src --fix

.PHONY: lint
lint: black isort ruff

.PHONY: secure-check
secure-check:
	@$(PM_RUN) bandit src -r

.PHONY: type-check
type-check:
	@$(PM_RUN) mypy src

.PHONY: run-static-tools
run-static-tools: lint secure-check type-check

.PHONY: startapp
startapp:
	@[ "${APP_NAME}" ] || ( echo ">> APP_NAME is not set"; exit 1 )
	@$(PM_RUN) $(MANAGEPY_DEST) startapp \
		--template=https://github.com/Tvo-Po/drf-project-template/archive/app-template.zip \
		--extension=md \
		$(APP_NAME) 
