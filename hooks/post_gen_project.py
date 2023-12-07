from pathlib import Path


PROJECT_DIR = Path(__file__).parent.parent

with open(PROJECT_DIR / "README.md", "w") as readme:
    readme.write(
        "# {{ cookiecutter.name }}\n"
        "{{ cookiecutter.description }}"
    )
