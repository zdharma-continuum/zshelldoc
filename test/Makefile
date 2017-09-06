test: nested real-zsyh

.PHONY: nested
nested: ../build/zsd ../build/zsd-transform ../build/zsd-detect ../build/zsd-to-adoc nested.zsh
	@echo "=== Testing: nested.zsh ==="
	rm -rf zsdoc
	../build/zsd -q nested.zsh
	diff -r zsdoc nested
	@zsh -c 'exit 0' || echo "Zsh unavailable, cannot test if scripts compile (nested.zsh)"
	@zsh -c 'zcompile "zsdoc/data/bodies/nested.zsh" 2>/dev/null || echo "Error compiling script body"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/dummy" 2>/dev/null || echo "Error compiling function: dummy"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test1" 2>/dev/null || echo "Error compiling function: test1"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test2" 2>/dev/null || echo "Error compiling function: test2"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test3" 2>/dev/null || echo "Error compiling function: test3"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test4" 2>/dev/null || echo "Error compiling function: test4"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test5" 2>/dev/null || echo "Error compiling function: test5"'
	@zsh -c 'zcompile "zsdoc/data/functions/nested.zsh/test6" 2>/dev/null || echo "Error compiling function: test6"'
	@echo

.PHONY: real-zsyh
real-zsyh: ../build/zsd ../build/zsd-transform ../build/zsd-detect ../build/zsd-to-adoc real-zsyh.zsh
	@echo "=== Testing: real-zsyh.zsh ==="
	rm -rf zsdoc
	../build/zsd -q real-zsyh.zsh
	diff -r zsdoc real-zsyh
	@zsh -c 'exit 0' || echo "Zsh unavailable, cannot test if scripts compile (nested.zsh)"
	@zsh -c 'zcompile "zsdoc/data/bodies/real-zsyh.zsh" 2>/dev/null || echo "Error compiling script body"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight" 2>/dev/null || echo "Error compiling function: _zsh_highlight"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight_add_highlight" 2>/dev/null || echo "Error compiling function: _zsh_highlight_add_highlight"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight_apply_zle_highlight" 2>/dev/null || echo "Error compiling function: _zsh_highlight_apply_zle_highlight"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight_bind_widgets" 2>/dev/null || echo "Error compiling function: _zsh_highlight_bind_widgets"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight_buffer_modified" 2>/dev/null || echo "Error compiling function: _zsh_highlight_buffer_modified"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight_call_widget" 2>/dev/null || echo "Error compiling function: _zsh_highlight_call_widget"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight_cursor_moved" 2>/dev/null || echo "Error compiling function: _zsh_highlight_cursor_moved"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight_load_highlighters" 2>/dev/null || echo "Error compiling function: _zsh_highlight_load_highlighters"'
	@zsh -c 'zcompile "zsdoc/data/functions/real-zsyh.zsh/_zsh_highlight_preexec_hook" 2>/dev/null || echo "Error compiling function: _zsh_highlight_preexec_hook"'
	@echo

.PHONY: clean
clean:
	rm -rf zsdoc
