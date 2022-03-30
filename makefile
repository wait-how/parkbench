CC := gcc

# not -Ofast because we care about math accuracy
OPT_FLAGS := -O3 -flto -march=native
FLAGS := $(OPT_FLAGS) -Wall -Wextra

.PHONY: clean

livermore-loops:
	@echo "currently broken as this is designed to be called from a Fortran kernel!"
	$(CC) $(FLAGS) --std=c89 c/livermore-loops.c -o livermore-loops

linpack:
	$(CC) $(FLAGS) -DSP -DUNROLL --std=c89 c/linpack.c -o linpack

dhrystone:
	$(CC) $(FLAGS) --std=c89 c/dhrystone.c -o dhrystone

whetstone:
	$(CC) $(FLAGS) -DUNIX -lm --std=c89 c/whetstone.c -o whetstone

clean:
	@rm -f whetstone dhrystone
