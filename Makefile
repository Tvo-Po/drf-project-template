PM_RUN = pdm run
MANAGEPY_DEST = src/manage.py

.PHONY: runserver
runserver:
	@$(PM_RUN) $(MANAGEPY_DEST) runserver

.PHONY: migrate
migrate:
	@$(PM_RUN) $(MANAGEPY_DEST) migrate $(MIGRATION) $(APP_NAMES)

.PHONY: makemigrations
makemigrations:
	@$(PM_RUN) $(MANAGEPY_DEST) makemigrations $(APP_NAMES)

.PHONY: startapp
startapp:
	@[ "${APP_NAME}" ] || ( echo ">> APP_NAME is not set"; exit 1 )
	@$(PM_RUN) $(MANAGEPY_DEST) startapp $(APP_NAME)
