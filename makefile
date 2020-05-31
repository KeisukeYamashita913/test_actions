TARGET = createROOTfile
 
DEP = $(TARGET).d
SRCS = $(TARGET).cc
OBJS = $(addsuffix .o, $(basename $(SRCS)))
 
ROOTCFLAGS = $(shell root-config --cflags)
ROOTLIBS = $(shell root-config --libs)
CXXFLAGS = $(ROOTCFLAGS) -Wall
CXXLIBS = $(ROOTLIBS)
CC = g++
 
all: dep $(TARGET)
 
$(TARGET):$(OBJS)
    $(CC) $(CXXLIBS) $(OBJS) -o $@
 
anaCalib:anaCalib.o
    $(CC) $(CXXLIBS) anaCalib.o -o $@
 
checkHist:checkHist.o
    $(CC) $(CXXLIBS) checkHist.o -o $@
 
.cc.o:
    $(CC) $(CXXFLAGS) -c $<
 
dep:
    $(CC) -MM $(CXXFLAGS) $(SRCS) > $(DEP) -include $(DEP)
 
clean:
    rm -f $(TARGET) $(OBJS) $(DEP)
 -include $(DEPS)
