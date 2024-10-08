install:
	pip install --upgrade pip && \
	pip install -r requirements.txt

test:
	python -m pytest --nbval data_science.ipynb
	# Use this to produce pytest outputs for GitLab
	# pytest -vv --junitxml=report.xml  

format:	
	black *.py */*.py

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py src/*.py

refactor: format lint
		
all: install lint test format