BASE_PYTHON := $(shell which python3)
PIPENV      := $(shell which pipenv)
PYTHON      := .venv/bin/python
PIP         := .venv/bin/pip
PIPENV_OPTS :=
export PIPENV_VENV_IN_PROJECT := 1

.PHONY: pipenv/*
pipenv/install:
	$(PIPENV) install $(PIPENV_OPTS)
pipenv/update:
	$(PIPENV) $(@F)
pipenv/graph:
	$(PIPENV) $(@F)
pipenv/check:
	$(PIPENV) $(@F)
	
.PHONY: download/*
download/rnn_model:
	wget https://www.oreilly.co.jp/pub/9784873118369/BetterRnnlm.pkl -O BetterRnnlm.pkl
	mv BetterRnnlm.pkl notebooks/deep-learning-from-scratch2/
