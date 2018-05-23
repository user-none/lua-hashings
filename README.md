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

A there are some functions, such as `hexdigest`, which are the same implementation
in multiple modules. This is by design because modules are intended to be independent
of the library itself. Each module can be copied into another project without needing
the rest of the library present. The hash functions are the same in that they can
be dropped into another project and used independent of the library provided that
anything using the hash functions implement's the above API.

Dependencies
------------

This library depnds on [lua-nums](https://github.com/user-none/lua-nums)
because many hashes rely on fixed width integers. It's also nedded
to support 64 bit hashes.

Usage
-----
Here is a minimal example of usage

`local digest = require("hashings.sha256"); `
`print(digest:new("Hello"):hexdigest())`

Performance
-----------

32 bit hashes have quite good performance. However, due to using lua-nums which
provides fixed width unsigned 64 bit integers 64 bit hashes are very slow. It is
not recommended to use 64 bit hashes in performance critical code.
