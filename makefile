CC := gcc
FLAGS := -Wall -Wextra

# not -Ofast because we care about math accuracy
OPT_FLAGS := -O3 -flto -march=native

.PHONY: clean

whetstone:
	$(CC) $(OPT_FLAGS) $(FLAGS) -DUNIX -lm --std=c89 -Wno-deprecated-declarations whetstone.c -o whetstone

clean:
	@rm -f whetstone
