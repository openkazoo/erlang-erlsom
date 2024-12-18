APPLICATION := erlsom

REBAR ?= rebar3

ERL := erl
EPATH := -pa ebin
TEST_EPATH := -pa .eunit

DIALYZER=dialyzer
DIALYZER_OPTS=-Wno_return -Wrace_conditions -Wunderspecs -Wbehaviours
PLT_FILE=.erlsom_plt
APPS=kernel stdlib

.PHONY: all clean test

all: compile

compile:
	@$(REBAR) compile

doc:
	@$(REBAR) doc

clean:
	@$(REBAR) clean

build-plt: compile
	@$(REBAR) build-plt

check-plt: compile
	@$(REBAR) check-plt

dialyze:
	@$(REBAR) dialyze

eunit:
	@$(REBAR) eunit

shell: compile
	$(ERL) -sname $(APPLICATION) $(EPATH)

touch:
	find . -name '*' -print | xargs touch -m
	find . -name '*.erl' -print | xargs touch -m
