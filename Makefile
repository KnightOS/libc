# Project variables
SDK=.knightos/
AS:=scas
CC:=kcc
GENKFS:=genkfs
KPACK:=kpack
VERSION:=$(shell knightos query version)
.DEFAULT_GOAL=all

OUT:=bin/
ROOT:=$(OUT)root/
BIN:=$(ROOT)bin/
LIB:=$(ROOT)lib/
ETC:=$(ROOT)etc/
VAR:=$(ROOT)var/
INC:=$(ROOT)include/
SHARE:=$(ROOT)share/
APPS:=$(VAR)applications/

ALL_TARGETS:=$(LIB)libc

$(LIB)libc: $(OUT)crt0.o $(OUT)display.o
	mkdir -p $(LIB)
	scas -l -r $(OUT)crt0.o $(OUT)display.o -o $(LIB)libc

.PHONY: all run clean help info package

$(OUT)crt0.o: crt0.asm
	mkdir -p $(OUT)
	$(AS) -I.knightos/include/ -O -o $(OUT)crt0.o crt0.asm

$(OUT)%.o: $(OUT)%.asm
	mkdir -p $(OUT)
	$(AS) -O -o $@ $<

$(OUT)%.asm: src/%.c
	mkdir -p $(OUT)
	$(CC) -I.knightos/include/ -I./ -S --std-c99 $< -o $@

$(INC)%.h: exported_headers/%.h
	cp $< $@

all: $(ALL_TARGETS)
	@rm -rf $(SDK)root
	@mkdir -p $(SDK)root
	@cp -r $(SDK)pkgroot/* $(SDK)root 2> /dev/null || true
	@rm -rf $(SDK)root/include
	@cp -r $(ROOT)* $(SDK)root/
	@cp $(SDK)kernel.rom $(SDK)debug.rom
	@mkdir -p $(SDK)root/etc
	@echo "$(INIT)" > $(SDK)root/etc/inittab
	@$(GENKFS) $(SDK)debug.rom $(SDK)root/ > /dev/null

clean:
	@rm -rf $(OUT)
	@rm -rf $(SDK)root
	@rm -rf $(SDK)debug.rom
	@rm -rf libc-$(VERSION).pkg

package: all
	kpack libc-$(VERSION).pkg $(ROOT)

install: package
	kpack -e -s libc-$(VERSION).pkg $(PREFIX)
	
help:
	@echo "KnightOS Makefile for libc"
	@echo "Usage: make [target]"
	@echo ""
	@echo "Common targets:"
	@echo "	all: 		Builds the entire project"
	@echo "	package:	Builds a KnightOS package"
	@echo "	install:	Installs this package at the specified PREFIX"
	@echo "	info:		Lists information about this project"
