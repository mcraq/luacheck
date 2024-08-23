
binary-darwin:
	luastatic bin/luacheck.lua \
		$(shell brew --prefix lua)/lib/liblua.a \
		-I$(shell brew --prefix lua)/include/lua
	mkdir -p build/darwin
	mv luacheck build/darwin/luacheck.darwin.$(shell uname -p)

binary-linux:
	docker build --platform linux/amd64 -t luacheck:releaser --target releaser .
	docker run -v $PWD/build/linux:/out luacheck:releaser