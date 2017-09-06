test: nested

.PHONY: nested
nested: clean ../build/zsd ../build/zsd-transform ../build/zsd-detect ../build/zsd-to-adoc nested.zsh
	../build/zsd -q nested.zsh
	diff -r zsdoc nested

clean:
	rm -rf zsdoc
