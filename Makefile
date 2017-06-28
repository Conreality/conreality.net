MCS   = mcs
NUGET = nuget

PACKAGE  := Conreality
ASSEMBLY := $(PACKAGE)
VERSION  := $(shell cat VERSION)

SOURCES  := $(wildcard src/*/*.cs src/*/*/*.cs)
OUTPUTS  := lib/$(ASSEMBLY).dll lib/$(ASSEMBLY).xml

lib/$(ASSEMBLY).dll: $(SOURCES)
	$(MCS) -target:library              \
	  -r:Npgsql -r:System.Data          \
	  -out:lib/$(ASSEMBLY).dll          \
	  -doc:lib/$(ASSEMBLY).xml          \
	  $(SOURCES)

lib/$(ASSEMBLY).xml: lib/$(ASSEMBLY).dll

$(PACKAGE).$(VERSION).nupkg: $(PACKAGE).nuspec $(OUTPUTS)
	$(NUGET) pack $(PACKAGE).nuspec     \
	  -Version $(VERSION)               \
	  -properties Configuration=Release

all: build

build: $(OUTPUTS)

check:
	@echo "not implemented" # TODO

dist: $(PACKAGE).$(VERSION).nupkg

install: $(PACKAGE).$(VERSION).nupkg
	@echo "not implemented" # TODO

clean:
	@rm -f *~ *.nupkg lib/*

distclean: clean

mostlyclean: clean

.PHONY: check install clean distclean mostlyclean
