test: nested

.PHONY: nested
nested: clean ../build/zsd ../build/zsd-transform ../build/zsd-detect ../build/zsd-to-adoc nested.zsh
	../build/zsd -q nested.zsh
	diff -r zsdoc nested
	@zsh -c 'zcompile "zsdoc/data/bodies/nested.zsh" 2>/dev/null || echo "Error compiling script body"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/dummy" 2>/dev/null || echo "Error compiling function: dummy"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test1" 2>/dev/null || echo "Error compiling function: test1"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test2" 2>/dev/null || echo "Error compiling function: test2"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test3" 2>/dev/null || echo "Error compiling function: test3"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test4" 2>/dev/null || echo "Error compiling function: test4"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test5" 2>/dev/null || echo "Error compiling function: test5"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test6" 2>/dev/null || echo "Error compiling function: test6"'

clean:
	rm -rf zsdoc
