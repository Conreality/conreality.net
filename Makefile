MCS   = mcs
NUGET = nuget

PACKAGE  = Conreality
ASSEMBLY = $(PACKAGE)
VERSION  = `cat VERSION`

SOURCES =                                   \
  src/Conreality/Action.cs                  \
  src/Conreality/Client.cs                  \
  src/Conreality/Game.cs                    \
  src/Conreality/Session.cs                 \
  src/Conreality/Properties/AssemblyInfo.cs

BINARIES =                                  \
  lib/$(ASSEMBLY).dll                       \
  lib/$(ASSEMBLY).xml

lib/$(ASSEMBLY).dll: $(SOURCES)
	$(MCS) -target:library              \
	  -r:Npgsql -r:System.Data          \
	  -out:lib/$(ASSEMBLY).dll          \
	  -doc:lib/$(ASSEMBLY).xml          \
	  $(SOURCES)

lib/$(ASSEMBLY).xml: lib/$(ASSEMBLY).dll

$(PACKAGE).$(VERSION).nupkg: $(PACKAGE).nuspec $(BINARIES)
	$(NUGET) pack $(PACKAGE).nuspec     \
	  -Version $(VERSION)               \
	  -properties Configuration=Release

all: build

build: $(BINARIES)

check:
	@echo "not implemented" # TODO

dist: $(PACKAGE).$(VERSION).nupkg

install:
	@echo "not implemented" # TODO

clean:
	@rm -f *~ *.nupkg lib/*

distclean: clean

mostlyclean: clean

.PHONY: check install clean distclean mostlyclean
