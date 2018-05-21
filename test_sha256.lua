local Digest = require("hashings.sha256")
local test = Digest:new("Hello"):hexdigest()
print(test)