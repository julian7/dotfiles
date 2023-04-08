require("dotfiles")

function optional_require(module)
	local function requiref(module)
		require(module)
	end
	pcall(requiref, module)
end

optional_require("local")
