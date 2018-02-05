temp_filename = tmp
raw_executable = good
segfault_executable = bad
src = getaddrinfo.c

all: $(segfault_executable) info

$(raw_executable): $(src)
	gcc -o $@ $< $(CFLAGS) $(LDFLAGS)

$(segfault_executable): $(raw_executable)
	cp $< $(temp_filename)
	./fixup_glibc_path.sh $(temp_filename)
	mv $(temp_filename) $@

info:
	gcc --version
	./info.sh $(raw_executable)
	./info.sh $(segfault_executable)

clean:
	rm -f $(temp_filename) $(raw_executable) $(segfault_executable)
