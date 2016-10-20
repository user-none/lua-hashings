local hashings = require("hashings")
require("vectors")

local M = {}

local function run_hash_test(hmod, name, input, output)
    hmod = hmod()

    for i=1,#input do
    	hmod:update(input[i])
        hd = hmod:hexdigest()

    	if hd == output[i] then
        	-- Run the digest again if the output matches to verify calling digest
        	-- doesn't update the internal data.
        	hd = hmod:hexdigest()
            if hd ~= output[i] then
                print("\tFail: " .. name .. " - digest again")
                return false
            end
        else
            print("\tFail: " .. name.." '"..hd.."'")
            return false
        end
    end

    return true
end

function M.hash_runner(name, hmod, output)
    local fail = false

    print("Hash Test: ".. name .. "...")

    for i=1,#hash_test_names do
    	if output[hash_test_names[i]] == nil then
    		print("\tOutput for test "..hash_test_names[i].." missing")
        else
    		if not run_hash_test(hmod, hash_test_names[i], hash_test_input[hash_test_names[i]], output[hash_test_names[i]]) then
    			fail = true
            end
        end
    end

    if not fail then
        print("\tPass")
    end
end

function M.hmac_runner(name, hmod, output)
    local fail = false
    local hmac
    local hd
    local tname
    local input
    local j

    print("HMAC Test: ".. name .. "...")

    for i=1,#hmac_test_names do
    	tname = hmac_test_names[i]
    	if output[tname] == nil then
    		print("\tOutput for test "..hmac_test_names[i].." missing")
        else
        	j = 1
        	input = hmac_test_input[tname]
        	hmac = hashings.hmac(hmod, input[1])
        	for i=2,#input do
        		hmac:update(input[i])
                hd = hmac:hexdigest()
                if hd ~= output[tname][j] then
                    print("\tFail: " .. tname .. "(" .. tostring(j) .. ") '" .. hd .. "'")
                    fail = true
                    break
                end
                j = j+1
            end
        end
    end

    if not fail then
        print("\tPass")
    end
end

function M.pbkdf2_runner(name, hmod, output)
    local fail = false
    local hd

    print("PBKDF2 Test: ".. name .. "...")

    for i=1,#pbkdf2_test_names do
    	local tname = pbkdf2_test_names[i]
    	if output[tname] == nil then
    		print("\tOutput for test "..tname.." missing")
        else
        	hd = hashings.pbkdf2(hmod, pbkdf2_test_input[tname][1], pbkdf2_test_input[tname][2], pbkdf2_test_input[tname][3])
            if hd ~= output[tname] then
                print("\tFail: " .. tname .." '"..hd.."'")
    			fail = true
            end
        end
    end

    if not fail then
        print("\tPass")
    end
end

return M
