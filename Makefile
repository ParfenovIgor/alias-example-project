BUILD_DIR=$(abspath build)
ALFLAGS=-i altlib $(ALTLIB)/include/
LDFLAGS=-z noexecstack

SRCS := $(wildcard *.al)
OBJS := $(patsubst %.al, $(BUILD_DIR)/%.o, $(SRCS))
OBJS_ALTLIB := $(wildcard $(ALTLIB)/lib/*.o)

all: $(OBJS)
	ld $(LDFLAGS) -o $(BUILD_DIR)/main $(OBJS) $(OBJS_ALTLIB)

$(BUILD_DIR)/%.o: %.al make_dir
	calias -a $(ALFLAGS) $< -o $@

make_dir:
	mkdir -p $(BUILD_DIR)

clean:
	rm -r $(BUILD_DIR)
