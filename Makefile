include .knightos/variables.make

AS=scas

OBJECTS=$(patsubst src/%.c,$(OUT)%.o,$(wildcard src/*.c))
OBJECTS+=$(patsubst src/knightos/%.c,$(OUT)knightos/%.o,$(wildcard src/knightos/*.c))
OBJECTS+=$(patsubst src/tios/%.c,$(OUT)tios/%.o,$(wildcard src/tios/*.c))
OBJECTS+=$(patsubst src/gpl/%.c,$(OUT)gpl/%.o,$(wildcard src/gpl/*.c))

OBJECTS+=$(patsubst src/%.asm,$(OUT)%.o,$(wildcard src/*.asm))
OBJECTS+=$(patsubst src/knightos/%.asm,$(OUT)knightos/%.o,$(wildcard src/knightos/*.asm))
OBJECTS+=$(patsubst src/tios/%.asm,$(OUT)tios/%.o,$(wildcard src/tios/*.asm))
OBJECTS+=$(patsubst src/gpl/%.asm,$(OUT)gpl/%.o,$(wildcard src/gpl/*.asm))

HEADERS=$(patsubst include/%.h,$(INC)%.h,$(wildcard include/*.h))
HEADERS+=$(patsubst include/knightos/%.h,$(INC)knightos/%.h,$(wildcard include/knightos/*.h))
HEADERS+=$(patsubst include/tios/%.h,$(INC)tios/%.h,$(wildcard include/tios/*.h))
HEADERS+=$(patsubst include/sys/%.h,$(INC)sys/%.h,$(wildcard include/sys/*.h))
HEADERS+=$(patsubst include/experimental/%.h,$(INC)experimental/%.h,$(wildcard include/experimental/*.h))

ALL_TARGETS:=$(SLIB)c $(HEADERS)

$(SLIB)c: dependencies $(OBJECTS)
	mkdir -p $(SLIB)
	scas -c $(OBJECTS) -o $(SLIB)c

$(INC)%.h: include/%.h
	mkdir -p $(INC)
	cp $< $@

$(INC)sys/%.h: include/sys/%.h
	mkdir -p $(INC)sys/
	cp $< $@

$(INC)experimental/%.h: include/experimental/%.h
	mkdir -p $(INC)experimental/
	cp $< $@

$(INC)knightos/%.h: include/knightos/%.h
	mkdir -p $(INC)knightos/
	cp $< $@

$(INC)tios/%.h: include/tios/%.h
	mkdir -p $(INC)tios/
	cp $< $@

include .knightos/sdk.make

$(OUT)%.o: src/%.asm
	mkdir -p $(OUT)gpl/
	$(AS) -c -I"$(INCLUDE)" -o $@ $<

$(OUT)gpl/%.o: src/gpl/%.asm
	mkdir -p $(OUT)gpl/
	$(AS) -c -I"$(INCLUDE)" -o $@ $<

$(OUT)gpl/%.o: $(OUT)gpl/%.asm
	mkdir -p $(OUT)gpl/
	$(AS) -c -I"$(INCLUDE)" -o $@ $<

$(OUT)%.o: $(OUT)gpl/%.asm
	mkdir -p $(OUT)gpl/
	$(AS) -c -I"$(INCLUDE)" -o $@ $<

$(OUT)%.o: $(OUT)%.asm
	mkdir -p $(OUT)gpl/
	$(AS) -c -I"$(INCLUDE)" -o $@ $<

$(OUT)%.asm: src/%.c $(HEADERS)
	mkdir -p $(OUT)gpl/
	mkdir -p $(OUT)knightos/
	mkdir -p $(OUT)tios/
	$(CC) -I.knightos/include/ -I./ -I./include/ -S --std-c99 $< -o $@
