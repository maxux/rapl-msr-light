EXEC = rapl-msr-light
CFLAGS += -W -Wall -O2 -g
LDFLAGS += -lm

SRC=rapl-msr-light.c
OBJ=$(SRC:.c=.o)

all: options $(EXEC)

options:
	@echo $(EXEC) build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -fv *.o

mrproper: clean
	rm -fv $(EXEC)
