include .knightos/variables.make

ALL_TARGETS:=$(LIB)c $(INC)__libc.h $(INC)display.h

$(LIB)c: libc.asm
	mkdir -p $(LIB)
	$(AS) $(ASFLAGS) --listing $(OUT)libc.list libc.asm $(LIB)c

$(INC)%.h: include/%.h
	mkdir -p $(INC)
	cp $< $@

include .knightos/sdk.make
