VERSION = 1.0.7
LDFLAGS = -ldflags '-s -w' -gcflags=-trimpath=${PWD} -asmflags=-trimpath=${PWD}
.PHONY: all linux_amd64 linux_arm64 darwin_amd64 darwin_arm64 windows_amd64 clean _build

all: linux_amd64 linux_arm64 darwin_amd64 darwin_arm64 windows_amd64
_build:
	go build $(LDFLAGS) -o aws-rotate-key-$(GOOS)-$(GOARCH)

linux_amd64:
	$(MAKE) _build GOOS=linux GOARCH=amd64
linux_arm64:
	$(MAKE) _build GOOS=linux GOARCH=arm64
darwin_amd64:
	$(MAKE) _build GOOS=darwin GOARCH=amd64
darwin_arm64:
	$(MAKE) _build GOOS=darwin GOARCH=arm64
windows_amd64:
	$(MAKE) _build GOOS=windows GOARCH=amd64
	NAME='aws-rotate-key-windows-amd64' && mv $$NAME $${NAME}.exe
clean:
	rm -f aws-rotate-key-*
