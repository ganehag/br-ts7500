all: ts7500ctl xuartctl spiflashctl sdctl dio
	$(COMPILER_PREFIX)strip $^

ts7500ctl: ts7500ctl.c ispvm.c
	$(COMPILER_PREFIX)gcc -o $@ $^

xuartctl: xuartctl.c
	$(COMPILER_PREFIX)gcc -lutil -o $@ $^

spiflashctl: spiflashctl.c
	$(COMPILER_PREFIX)gcc -lutil -o $@ $^

sdctl: sdctl.c
	$(COMPILER_PREFIX)gcc -o $@ $^

dio: dio.c sbus.c
	$(COMPILER_PREFIX)gcc -lutil -o $@ $^

clean:
	rm -f *.o ts7500ctl xuartctl spiflashctl sdctl dio
