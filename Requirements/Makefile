.PHONY: bootstrap clean lint test
.DEFAULT_GOAL := test

test: clean lint
	@py.test test/ --cov app.py -s

lint:
	@flake8 .

clean:
	@find . -type f -name '*.pyc' -delete

bootstrap:
	@sudo pip install -r requirements.txt
	@sudo pip install -r requirements-test.txt
	@sudo python setup.py develop
