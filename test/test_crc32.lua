local hmod = require("hashings").crc32
local runner = require("runner")

local hash_test_output = {
    v1 =  { "00000000" },
    v2 =  { "352441C2" },
    v3 =  { "C2690FDF" },
    v4 =  { "414FA339" },
    v5 =  { "F61C5695" },
    v6 =  { "A0CAAF8B" },
    v7 =  { "75347667" },
    v8 =  { "41DE955C" },
    v9 =  { "4D027FE6" },
    v10 = { "1550633F" },
    v11 = { "04F9AD2B" },
    v12 = { "D679541E" },
    v13 = { "23F7D295" },
    v14 = { "F420E643" },
    v15 = { "2D865A4C" },
    v16 = { "9097C7F1" },
    v17 = { "6D632434" },
    v18 = { "CDE6DF13" },
    v19 = { "B4CDD8F1" },
    v20 = { "76629A1C" },
    v21 = { "C3747D4F" },
    v22 = { "3DDE37A0", "EDF632E1" },
    v23 = { "F7F4B8DB", "0AF830EF", "B5D55D71" }
}

runner.hash_runner("crc32", hmod, hash_test_output)
