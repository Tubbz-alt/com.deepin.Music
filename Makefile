BUILDER_OPTIONS = --force-clean --ccache --rebuild-on-sdk-change
TARGET_REPO = repo
FLATPAK_BUILDER = $(shell which flatpak-builder)
MANIFEST = com.deepin.Music.json

all: build bundle

build: $(MANIFEST)
	$(FLATPAK_BUILDER) \
		$(BUILDER_OPTIONS) \
		--repo=$(TARGET_REPO) \
		music \
		$(MANIFEST)
bundle:
	flatpak build-bundle ./repo bundle com.deepin.Music master

clean:
	rm -rf sublime repo .flatpak-builder
