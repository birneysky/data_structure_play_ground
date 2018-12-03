BUILDDIR := build
TARGETDIR := bin
SRCS := $(shell find ./src -name *.cpp)
OBJECTS := $(patsubst %, $(BUILDDIR)/%,$(notdir $(SRCS:%.cpp=%.o)))
SPATH := $(sort $(dir $(SRCS)))
VPATH := $(SPATH)
DEP := $(OBJECTS:%.o=%.d)
LIBS := -lavutil -lavformat -lSDL2
# -m - MM 表示输出文件依赖关系
# -MT 指定目标文件名

playground:$(OBJECTS)
	@mkdir -p $(TARGETDIR)
	@clang++ $^ $(LIBS) -g -o $(TARGETDIR)/playground

$(BUILDDIR)/%.d: %.cpp
	@mkdir -p $(BUILDDIR)
	@clang++ -MM $< -o $@ -MT $(patsubst %.d, %.o, $@)
	
include $(DEP)

$(BUILDDIR)/%.o: %.cpp
	@echo "Compiling " $<
	@clang++ -Wall -std=c++11 -stdlib=libc++ -g -c $<  -o $@

