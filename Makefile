install:
	pip install --upgrade pip && \
	pip install -r requirements.txt

test:
	python -m pytest --nbval data_science.ipynb
	# Use this to produce pytest outputs for GitLab
	# pytest -vv --junitxml=report.xml  

format:	
	black *.py

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py

refactor: format lint
		
all: install lint test format