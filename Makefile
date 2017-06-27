MCS = mcs

SOURCES =                                   \
  src/Conreality/Client.cs                  \
  src/Conreality/Properties/AssemblyInfo.cs

all: build

lib/Conreality.dll: $(SOURCES)
	$(MCS) -target:library              \
	  -r:Npgsql -r:System.Data          \
	  -out:lib/Conreality.dll           \
	  -doc:lib/Conreality.xml           \
	  $(SOURCES)

lib/Conreality.xml: lib/Conreality.dll

build: lib/Conreality.dll lib/Conreality.xml

check:
	@echo "not implemented" # TODO

install:
	@echo "not implemented" # TODO

clean:
	@rm -f *~ *.nupkg lib/*

.PHONY: build check install clean
