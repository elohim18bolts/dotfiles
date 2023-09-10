function runc()
	vim.ui.input({
		prompt = "Run Command: ",
	}, function(input)
		vim.cmd(string.format("!%s", input))
	end
	)
end

return { runc = runc }
