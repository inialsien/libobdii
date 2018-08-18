CROSS=arm-cortexa9_neon-linux-gnueabi-
CC=$(CROSS)gcc
AR=$(CROSS)ar
CFLAGS=
LDFLAGS=
SRC_DIR=./src/
SRC=$(wildcard $(SRC_DIR)*.c)
OBJ_DIR=./bin/
OBJ=$(SRC:.c=.o)
EXEC=libobdii.a

all: $(OBJ)
	$(AR) -cr $(OBJ_DIR)$(EXEC) $^

%.o : %.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ -c $^

clean :
	rm -rf $(SRC_DIR)*.o

mrproper : clean 
	rm -rf $(EXEC)
