local hmod = require("hashings").adler32
local runner = require("runner")

local hash_test_output = {
    v1 =  { "00000001" },
    v2 =  { "024D0127" },
    v3 =  { "0D0B0277" },
    v4 =  { "5BDC0FDA" },
    v5 =  { "E45D177F" },
    v6 =  { "042C181F" },
    v7 =  { "24CD18C1" },
    v8 =  { "46521965" },
    v9 =  { "68BE1A0B" },
    v10 = { "75183235" },
    v11 = { "C773331A" },
    v12 = { "1B433401" },
    v13 = { "706D34EA" },
    v14 = { "C70335D5" },
    v15 = { "CDD5D52B" },
    v16 = { "A298D795" },
    v17 = { "7BC6DA01" },
    v18 = { "5962DC6F" },
    v19 = { "3B6FDEDF" },
    v20 = { "98EE5DDF" },
    v21 = { "116D0FD7" },
    v22 = { "50C46121", "19CE6AD7" },
    v23 = { "F9F30EB3", "09280F26", "18C20F9A" }
}

runner.hash_runner("adler32", hmod, hash_test_output)
