Lua-hashings
============

Pure Lua cryptographic hash library.

Supported hashes
----------------

* adler32
* blake2b
* blake2s
* crc32
* md5
* ripemd160
* sha1
* sha256
* sha3_256
* sha3_512
* sha512
* whirlpool

Additional hash functions
-------------------------

* hmac
* pbkdf2

API
---

All hash modules support the same API and any module implementing
this API can be used by the additional hash functions.

* `new(data)` or `(data)`
* `copy()`
* `update(data)`
* `digest()`
* `hexdigest()`

The digest and hexdigest functions will not change the internal state
of the object. Multiple calls to these will return the same result.

All hash modules provide the following information about the hash.

* digest_size
* block_size

There are some functions, such as `hexdigest`, which are the same implementation
in multiple modules. This is by design because modules are intended to be independent
of the library itself. Each module can be copied into another project without needing
the rest of the library. The hash functions are the same in that they can
be dropped into another project and used independent of the library provided that
anything using the hash functions implements the above API.

Dependencies
------------

This library depends on [lua-nums](https://github.com/user-none/lua-nums)
because many hashes rely on fixed width integers. It's also needed
to support 64 bit hashes.

Example Use
-----------

LUA_PATH="../lua-nums/?/init.lua;../lua-nums/?.lua;../lua-hashings/?/init.lua;../lua-hashings/?.lua;./?.lua" lua hs.lua

```lua
local digest = require("hashings.sha256")
print(digest:new("Hello"):hexdigest())
```

```lua
local hashings = require("hashings")
local hs = hashings("sha256")
hs:update("Hello")
print(hs:hexdigest())
```

```lua
local mod = require("hashings").sha256
local hs = mod()
hs:update("Hello")
print(hs:hexdigest())
```

### HMAC

```lua
local hashings = require("hashings")
local hs = hashings.hmac(hashings.sha256, 'secret123', "Hello")
print(hs:hexdigest())
```

```lua
local hashings = require("hashings")
local hs = hashings.hmac(hashings.sha256, 'secret123')
hs:update("Hello")
print(hs:hexdigest())
```

### PBKDF2

```lua
local hashings = require("hashings")
print(hashings.pbkdf2(hashings.sha256, "password", 123, 256))
```

### Large File

```lua
local hs = require("hashings").sha256()
local f = io.open("hs.lua", "rb")
while true do
    local r = f:read(2)
    if r == nuil then
        break
    end
    hs:update(r)
end
print(hs:hexdigest())
```

Performance
-----------

32 bit hashes have quite good performance. However, due to using lua-nums which
provides fixed width unsigned 64 bit integers 64 bit hashes are very slow. It is
not recommended to use 64 bit hashes in performance critical code.
