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

* new(data) or (data)
* copy()
* update(data)
* digest()
* hexdigest()

The digest and hexdigest functions will not change the internal state
of the object. Multiple calls to these will return the same result.

All hash modules provide the following information about the hash.

* digest_size
* block_size

Dependencies
------------

This library depnds on [lua-nums](https://github.com/user-none/lua-nums)
because many hashes rely on fixed width integers. It's also nedded
to support 64 bit hashes.

Performance
-----------

32 bit hashes have quite good performance. However, due to using lua-nums which
provides fixed width unsigned 64 bit integers 64 bit hashes are very slow. It is
not recommended to use 64 bit hashes in performance critical code.
